import json
import sys
import cx_Oracle

def generate_insert_sql(table_name, data, parent_id=None):
    insert_sql = f"INSERT INTO {table_name} ("
    columns = []
    values = []
    for key, value in data.items():
        columns.append(key)
        if isinstance(value, dict):
            nested_insert_sql, nested_values = generate_insert_sql(key, value, parent_id)
            insert_sql += nested_insert_sql
            values += nested_values
        else:
            insert_sql += f"{key}, "
            values.append(value)
    insert_sql = insert_sql.rstrip(", ") + ") VALUES ("
    for _ in values:
        insert_sql += ":1, "
    insert_sql = insert_sql.rstrip(", ") + ")"
    return insert_sql, values

def insert_data(cursor, json_data, schema):
    for table_name, table_data in json_data.items():
        if table_name in schema:
            for item in table_data:
                insert_sql, values = generate_insert_sql(table_name, item)
                cursor.execute(insert_sql, values)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python insert_data.py <json_file>")
        sys.exit(1)

    json_file = sys.argv[1]

    try:
        with open(json_file, 'r') as file:
            json_data = json.load(file)
    except FileNotFoundError:
        print(f"Error: File '{json_file}' not found.")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: File '{json_file}' is not a valid JSON file.")
        sys.exit(1)

    try:
        connection = cx_Oracle.connect(
            user="your_username",
            password="your_password",
            dsn="your_dsn" 
        )

        if connection:
            cursor = connection.cursor()

            schema_file = "schema_output.txt" 
            with open(schema_file, 'r') as schema_output_file:
                schema_sql = schema_output_file.read()

            cursor.execute(schema_sql)

            schema = {} 

            insert_data(cursor, json_data, schema)

            connection.commit()
            cursor.close()
            connection.close()
            print("Data inserted successfully.")
    except cx_Oracle.Error as error:
        print("Error while connecting to Oracle:", error)
