import sys
import xmltodict
import json
import xml

def convert_xml_to_json(xml_file):
    try:
        with open(xml_file, 'r') as f:
            xml_data = f.read()

        json_data = xmltodict.parse(xml_data, force_list={'item'}) 
        return json_data
    except FileNotFoundError:
        print(f"Error: File '{xml_file}' not found.")
        sys.exit(1)
    except xml.parsers.expat.ExpatError as e:
        print(f"Error parsing XML: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <xml_file>")
        sys.exit(1)

    xml_file = sys.argv[1]
    json_data = convert_xml_to_json(xml_file)
    
    with open('output.json', 'w') as json_file:
        json.dump(json_data, json_file, indent=4)

    print("Conversion complete. JSON data written to output.json.")
