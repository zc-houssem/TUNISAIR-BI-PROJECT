import os
import xml.etree.ElementTree as ET

def decompose_xml(input_file, output_dir, chunk_size):
    # Create output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Parse the XML file
    tree = ET.parse(input_file)
    root = tree.getroot()

    # Calculate the number of chunks needed
    total_chunks = len(root) // chunk_size
    if len(root) % chunk_size != 0:
        total_chunks += 1

    # Decompose XML into chunks
    for i in range(total_chunks):
        start_idx = i * chunk_size
        end_idx = min((i + 1) * chunk_size, len(root))
        chunk_root = ET.Element(root.tag)
        chunk_root.extend(root[start_idx:end_idx])

        # Write chunk to a separate file
        output_file = os.path.join(output_dir, f'chunk_{i+1}.xml')
        with open(output_file, 'wb') as f:
            f.write(ET.tostring(chunk_root))

if __name__ == "__main__":
    input_file = 'PRD.REV.TU.DWH.REGULAR_230412_090000_0000001.xml'  # Your input XML file
    output_dir = 'output'     # Directory to store decomposed files
    chunk_size = 350          # Number of elements per chunk

    decompose_xml(input_file, output_dir, chunk_size)
