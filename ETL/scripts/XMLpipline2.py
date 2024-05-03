import xml.etree.ElementTree as ET
import cx_Oracle
import json

def json_to_dict(file_path):
    with open(file_path, 'r') as f:
        data = json.load(f)
    return data

def get_text(element):
    return element.text if element is not None else None

def get_attribute(element, attribute):
    return element.attrib.get(attribute) if element is not None else None
    
dataset = json_to_dict("./dataset.json")

print(dataset)


def extract(xml_file,columns):
    print("Extraction des données en cours...")
    try:
        tree = ET.parse(xml_file)
        root = tree.getroot()
        extracted_data = []
        ns = {
            'rev': 'http://xml.amadeus.com/2010/06/REV_v1'
        }

        for transaction in root.findall('.//rev:Transaction', ns):
            data = {}
            for column in columns:
                data[column] = get_text(transaction.find(f'.//rev:{column}' , ns))
            extracted_data.append(data)

        print("Extraction des données terminée.")
        return extracted_data

    except Exception as e:
        print(f"Erreur lors de l'extraction des données : {e}")
        return None

# def transform_simple(extracted_data):
#     print("Transformation des données en cours...")
#     transformed_data = []

#     for data in extracted_data:
#         transformed_data.append({
#             'DocumentInternalId': data['DocumentInternalId'],
#             'PrimaryDocumentNbr': data['PrimaryDocumentNbr'],
#             'DocumentType': data['DocumentType'],
#             'DocumentOperationalStatus': data['DocumentOperationalStatus'],
#             'IssueIndicator': data['IssueIndicator'],
#             'TransactionCode': data['TransactionCode'],
#             'TransactionType': data['TransactionType'],
#             'NumberOfConjunctiveTickets': data['NumberOfConjunctiveTickets'],
#             'FullRouting': data['FullRouting'],
#             'ValidatingCarrier': data['ValidatingCarrier'],
#             'DateOfIssuance': data['DateOfIssuance'],
#             'AcquisitionType': data['AcquisitionType'],
#             'InvoluntaryIndicator': data['InvoluntaryIndicator'],
#             'IsLafAppliedIndicator': data['IsLafAppliedIndicator'],
#             'IsRedemptionTicket': data['IsRedemptionTicket'],
#             'IsRedemptionWithFareTicket': data['IsRedemptionWithFareTicket'],
#             'IsScheduleChange': data['IsScheduleChange'],
#             'AgencyName': data['AgencyName'],
#             'CityPOS': data['IssuanceDetails']['CityPOS'],
#             'IssuerSystem': data['IssuanceDetails']['IssuerSystem'],
#             'Channel': data['IssuanceDetails']['Channel'],
#             'Iata': data['IssuanceDetails']['Iata'],
#             'OfficeId': data['IssuanceDetails']['OfficeId'],
#             'CountryCodeOfIssue': data['IssuanceDetails']['CountryCodeOfIssue'],
#             'SASI': data['IssuanceDetails']['SASI'],
#             'AgentSign': data['IssuanceDetails']['AgentSign']
#         })

#     print("Transformation des données terminée.")
#     return transformed_data


def load(transformed_data, username, password, host, port, service_name, table_name):
    print("Chargement des données en cours...")
    
    # Connexion à la base de données Oracle
    dsn_tns = cx_Oracle.makedsn(host, port, service_name=service_name)
    connection = cx_Oracle.connect(user=username, password=password, dsn=dsn_tns)
    
    try:
        cursor = connection.cursor()

        # Création de la table s'il n'existe pas déjà
        create_table_query = f"""
        CREATE TABLE {table_name} (
            DocumentInternalId VARCHAR2(50),
            PrimaryDocumentNbr VARCHAR2(50),
            DocumentType VARCHAR2(50),
            DocumentOperationalStatus VARCHAR2(50),
            IssueIndicator VARCHAR2(50),
            TransactionCode VARCHAR2(50),
            TransactionType VARCHAR2(50),
            NumberOfConjunctiveTickets VARCHAR2(50),
            FullRouting VARCHAR2(50),
            ValidatingCarrier VARCHAR2(50),
            DateOfIssuance DATE,
            AcquisitionType VARCHAR2(50),
            InvoluntaryIndicator VARCHAR2(50),
            IsLafAppliedIndicator VARCHAR2(50),
            IsRedemptionTicket VARCHAR2(50),
            IsRedemptionWithFareTicket VARCHAR2(50),
            IsScheduleChange VARCHAR2(50),
            AgencyName VARCHAR2(255),
            CityPOS VARCHAR2(50),
            IssuerSystem VARCHAR2(50),
            Channel VARCHAR2(50),
            Iata VARCHAR2(50),
            OfficeId VARCHAR2(50),
            CountryCodeOfIssue VARCHAR2(50),
            SASI VARCHAR2(50),
            AgentSign VARCHAR2(50)
        )
        """
        cursor.execute(create_table_query)

        # Insertion des données dans la table
        insert_query = f"""
        INSERT INTO {table_name} (
            DocumentInternalId, PrimaryDocumentNbr, DocumentType, DocumentOperationalStatus,
            IssueIndicator, TransactionCode, TransactionType, NumberOfConjunctiveTickets,
            FullRouting, ValidatingCarrier, DateOfIssuance, AcquisitionType,
            InvoluntaryIndicator, IsLafAppliedIndicator, IsRedemptionTicket,
            IsRedemptionWithFareTicket, IsScheduleChange, AgencyName,
            CityPOS, IssuerSystem, Channel, Iata, OfficeId,
            CountryCodeOfIssue, SASI, AgentSign
        ) VALUES (
            :DocumentInternalId, :PrimaryDocumentNbr, :DocumentType, :DocumentOperationalStatus,
            :IssueIndicator, :TransactionCode, :TransactionType, :NumberOfConjunctiveTickets,
            :FullRouting, :ValidatingCarrier, TO_DATE(:DateOfIssuance, 'YYYY-MM-DD'), :AcquisitionType,
            :InvoluntaryIndicator, :IsLafAppliedIndicator, :IsRedemptionTicket,
            :IsRedemptionWithFareTicket, :IsScheduleChange, :AgencyName,
            :CityPOS, :IssuerSystem, :Channel, :Iata, :OfficeId,
            :CountryCodeOfIssue, :SASI, :AgentSign
        )
        """
        cursor.executemany(insert_query, transformed_data)
        connection.commit()

        print("Chargement des données terminé.")
    except Exception as e:
        print(f"Erreur lors du chargement des données : {e}")
        connection.rollback()
    finally:
        cursor.close()
        connection.close()


# Utilisation de la fonction load avec les données transformées
# Assurez-vous d'avoir les informations de connexion à la base de données Oracle correctes
username = "system"
password = "10052000"
host = "localhost"  # Ou l'adresse IP de votre serveur Oracle
port = "1521"  # Port par défaut pour Oracle
service_name = "orcl"
table_name = "tunisair"

# Test de la fonction extract() avec le fichier XML fourni
xml_file = 'C:\\pfe\\Fichiers XML\\x1\\xml1 (2).xml'
extracted_data = extract(xml_file)
if extracted_data:
    transformed_data = transform_simple(extracted_data)
    print(transformed_data)
    
    # Chargement des données dans la base de données Oracle
    load(transformed_data, username, password, host, port, service_name, table_name)
else:
    print("Une erreur s'est produite lors de l'extraction des données.")
