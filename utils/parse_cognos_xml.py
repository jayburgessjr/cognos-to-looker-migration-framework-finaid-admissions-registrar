import xml.etree.ElementTree as ET
from typing import List, Dict

def extract_fields_from_cognos_xml(xml_path: str) -> List[Dict]:
    """Minimal example parser for Cognos report XML metadata."""
    tree = ET.parse(xml_path)
    root = tree.getroot()
    fields = []
    for data_item in root.iter('dataItem'):
        name = data_item.get('name')
        expr_el = data_item.find('expression')
        expression = expr_el.text.strip() if expr_el is not None and expr_el.text else None
        fields.append({"field_name": name, "expression": expression})
    return fields
