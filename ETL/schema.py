import json

#define data detection
def infer_data_type(value):
    if isinstance(value, int):
        return "NUMBER"
    elif isinstance(value, float):
        return "NUMBER"
    elif isinstance(value, bool):
        return "BOOLEAN"
    elif isinstance(value, str):
        return "VARCHAR2(255 BYTE)"
    elif isinstance(value, dict):
        return "JSON"
    elif isinstance(value, list):
        return "JSON"
    else:
        return "VARCHAR2(255 BYTE)" 

def json_to_sql(json_data):
    tables = {}

    def process_data(data, table_name=''):
        if isinstance(data, dict):
            if not table_name:
                table_name = 'main'
                tables[table_name] = {}
            for key, value in data.items():
                column_name = key.replace('@', '')
                column_type = infer_data_type(value)
                if isinstance(value, dict) or isinstance(value, list):
                    sub_table_name = key[:30].replace('@', '')
                    if sub_table_name not in tables:
                        tables[sub_table_name] = {}
                    tables[table_name][column_name] = f"{column_type} REFERENCES {sub_table_name}(id)"
                    process_data(value, sub_table_name)
                else:
                    tables[table_name][column_name] = column_type
        elif isinstance(data, list):
            if len(data) > 0 and (isinstance(data[0], dict) or isinstance(data[0], list)):
                sub_table_name = f"{table_name}_list"
                if sub_table_name not in tables:
                    tables[sub_table_name] = {}
                tables[table_name][table_name[:30].replace('@', '')] = f"{infer_data_type(data[0])} REFERENCES {sub_table_name}(id)"
                process_data(data[0], sub_table_name)

    process_data(json_data)

    sql_statements = []
    for table_name, columns in tables.items():
        create_table_sql = f"CREATE TABLE {table_name} (\n"
        for column, data_type in columns.items():
            create_table_sql += f"    {column} {data_type.upper()},\n"
        create_table_sql += "    id NUMBER(10,0) PRIMARY KEY\n"
        create_table_sql = create_table_sql.rstrip(',\n') + "\n);"
        sql_statements.append(create_table_sql)

    return sql_statements

def main():
    with open('example.json', 'r') as file:
        json_data = json.load(file)

    sql_statements = json_to_sql(json_data)

    for statement in sql_statements:
        print(statement)

if __name__ == "__main__":
    main()
