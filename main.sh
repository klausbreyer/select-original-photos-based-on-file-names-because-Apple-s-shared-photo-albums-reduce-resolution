#!/bin/bash

# Define the directories
input_folder="input"
reference_folder="referenz"
output_folder="output"

# Create the output folder if it does not exist
mkdir -p "$output_folder"

# List for missing files
missing_files=()

# Iterate through each file in the reference folder
for reference_file in "$reference_folder"/*; do
  # Extract the filename without path and without extension
  reference_basename=$(basename "$reference_file")
  reference_name="${reference_basename%.*}"

  # Ignore everything after the first dash in the filename
  reference_name_before_dash="${reference_name%%-*}"

  # Search for a file in the input folder with the same name (ignoring the extension)
  input_file=$(find "$input_folder" -type f -name "$reference_name_before_dash.*" -print -quit)

  if [[ -n "$input_file" ]]; then
    # Extract the basename of the file to be copied
    input_basename=$(basename "$input_file")

    # Check if the file already exists in the output folder
    if [[ -f "$output_folder/$input_basename" ]]; then
      echo "File $input_basename already exists in $output_folder, skipping copy."
    else
      # If the file is found and does not exist, copy it to the output folder
      cp "$input_file" "$output_folder"
      echo "Copying $input_file to $output_folder"
    fi
  else
    # If the file is not found, add it to the list of missing files
    missing_files+=("$reference_basename")
    echo "Error: No matching file for $reference_basename found in the input folder."
  fi
done

# At the end, print the list of missing files
if [[ ${#missing_files[@]} -gt 0 ]]; then
  echo -e "\nList of files from the reference folder that were not found in the input folder:"
  for missing_file in "${missing_files[@]}"; do
    echo "- $missing_file"
  done
else
  echo -e "\nAll files from the reference folder were found in the input folder."
fi
