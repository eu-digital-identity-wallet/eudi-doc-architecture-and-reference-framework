import csv
from jinja2 import Environment, FileSystemLoader
import os

def load_requirements_by_category(csv_path):
    """
    Loads requirements from a CSV file and organizes them into a dictionary
    keyed by category.

    Args:
        csv_path (str): The path to the input CSV file.

    Returns:
        dict: A dictionary where keys are categories and values are lists
              of requirement dictionaries (each row from the CSV).
    """
    # Define the categories to ensure consistent keys
    categories = [
        "Wallet Providers",
        "Member States & Registrars",
        "Attestation & PID Providers",
        "Relying Parties",
        "Protocols & Interoperability",
        "Data Models & Attestation Rules"
    ]

    requirements = {category: [] for category in categories}

    try:
        with open(csv_path, mode='r', encoding='utf-8-sig') as infile:
            reader = csv.DictReader(infile, delimiter=';')
            for row in reader:
                category = row.get("Category")
                if category in requirements:
                    requirements[category].append(row)
                else:
                    print(f"Warning: Unknown category '{category}' in CSV row. Skipping.")
    except FileNotFoundError:
        print(f"Error: The file '{csv_path}' was not found.")
        return None
    except Exception as e:
        print(f"An error occurred while reading the CSV file: {e}")
        return None

    return requirements

def generate_markdown_file(template_name, csv_name, output_name):
    """
    Generates a markdown file by rendering a Jinja2 template with data from a CSV.

    Args:
        template_name (str): The filename of the Jinja2 template.
        csv_name (str): The filename of the CSV data source.
        output_name (str): The filename for the output markdown file.
    """
    # 1. Set up the Jinja2 environment to look for templates in the current directory
    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    try:
        template = env.get_template(template_name)
    except Exception as e:
        print(f"Error loading template '{template_name}': {e}")
        return

    # 2. Load the requirements data from the CSV file
    categorized_reqs = load_requirements_by_category(csv_name)
    if categorized_reqs is None:
        print("Halting script due to error in loading requirements.")
        return

    # 3. Render the template by passing the categorized requirements dictionary to it
    try:
        output_content = template.render(requirements=categorized_reqs)
    except Exception as e:
        print(f"Error rendering template: {e}")
        return

    # 4. Write the final rendered content to the output file
    try:
        with open(output_name, 'w', encoding='utf-8') as outfile:
            outfile.write(output_content)
        print(f"Successfully generated '{output_name}'")
    except Exception as e:
        print(f"An error occurred while writing the output file: {e}")

if __name__ == '__main__':
    # Define the input and output filenames
    template_file = 'annex-2.03-high-level-requirements-by-category.jinja2'
    csv_file = '../high-level-requirements.csv'
    output_file = '../../docs/annexes/annex-2/annex-2.03-high-level-requirements-by-category.md'

    # Ensure you have the Jinja2 library installed: pip install Jinja2

    # Run the generation process
    generate_markdown_file(template_file, csv_file, output_file)
