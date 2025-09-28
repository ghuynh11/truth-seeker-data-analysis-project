import pandas as pd
import csv

def clean_excel_to_csv(input_file, output_file):
    # Step 1: Read the Excel file
    df = pd.read_csv(input_file)  # Read the Excel file into a DataFrame
    
    # Step 2: Open the output CSV file for writing
    with open(output_file, 'w', encoding='utf-8', newline='') as outfile:
        writer = csv.writer(outfile)
        
        # Step 3: Loop through each row in the DataFrame
        for row in df.values:
            cleaned_row = []
            for col in row:
                # Convert non-string values to strings for consistency
                col = str(col) if col is not None else ''
                
                # Remove newlines inside fields
                col = col.replace("\n", " ")
                
                # Escape quotes properly
                col = col.replace('"', '""')
                
                cleaned_row.append(col)
            
            # Write the cleaned row to the CSV file
            writer.writerow(cleaned_row)
    
    print(f"CSV cleaning complete. Cleaned file saved as {output_file}")

# Example usage:
input_file = 'Features_For_Traditional_ML_Techniques.csv'  # Replace with your input Excel file path
output_file = 'Features_For_Traditional_ML_Techniques_clean.csv'  # Replace with your output CSV file path
clean_excel_to_csv(input_file, output_file)
