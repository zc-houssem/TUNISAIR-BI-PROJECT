import pandas as pd

def extract(xml_file):
    try:
     
        # Extraction des données depuis le fichier XML
        df = pd.read_xml(xml_file)

        # KPI : Montant total des billets transportés
        montant_billets = df['TotalDocumentAmount'].sum()

        # KPI : Chiffre d'affaires d'une taxe par année
        chiffre_affaires_taxes = df.groupby('Year')['TaxAmount'].sum()

        # KPI : Évaluation du statut du billet
        evaluation_statut_billet = df['DocumentOperationalStatus'].value_counts()

        # KPI : Évaluation du chiffre d'affaires par vente
        chiffre_affaires_ventes = df.groupby('TransactionType')['TotalDocumentAmount'].sum()

        # KPI : Commution par agences
        commution_agences = df.groupby('AgencyName')['TotalDocumentAmount'].sum()

        return montant_billets, chiffre_affaires_taxes, evaluation_statut_billet, chiffre_affaires_ventes, commution_agences
    except Exception as e:
        print(f"Une erreur s'est produite lors de l'extraction des données : {str(e)}")
        return None

# Exemple d'utilisation de la fonction extract()
xml_file = r'C:\pfe\Fichiers XML\x1\x1 (2).xml'
kpi_data = extract(xml_file)

if kpi_data is not None:
    montant_billets, chiffre_affaires_taxes, evaluation_statut_billet, chiffre_affaires_ventes, commution_agences = kpi_data

    print("Montant total des billets transportés :", montant_billets)
    print("\nChiffre d'affaires d'une taxe par année :\n", chiffre_affaires_taxes)
    print("\nÉvaluation du statut du billet :\n", evaluation_statut_billet)
    print("\nÉvaluation du chiffre d'affaires par vente :\n", chiffre_affaires_ventes)
    print("\nCommution par agences :\n", commution_agences)
else:
    print("Une erreur s'est produite lors de l'extraction des données.")

