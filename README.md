
# select-original-photos-based-on-file-names-because-Apple-s-shared-photo-albums-reduce-resolution

SyncLite is a shell script that helps to select original photos from an input directory based on file names from a reference directory. This is particularly useful for situations where Apple's shared photo albums reduce the resolution of photos, and you want to recover the originals.

## Features

- Iterates through each file in the `referenz` (reference) folder.
- Checks if a file with the same name (ignoring the file extension and any text after the first dash in the filename) exists in the `input` folder.
- Copies the file to the `output` folder if it exists and does not already exist in `output`.
- Logs an error message if the corresponding file in `input` is not found.
- Provides a list of all missing files at the end of the process.

## Usage

### Prerequisites

- A Unix-based shell environment (e.g., Linux, macOS, or WSL on Windows).
- Basic knowledge of the terminal and shell commands.
- Ensure the `input`, `referenz`, and `output` directories are present in the same directory as the script or adjust the paths in the script accordingly.

### Installation

1. **Clone the Repository:**
   Clone this repository or copy the script into a new file named `main.sh`.

2. **Make the Script Executable:**
   Run the following command to make the script executable:

   ```bash
   chmod +x main.sh
   ```

### Running the Script

Execute the script from the terminal:

```bash
./main.sh
```

### Expected Output

The script will display messages on the terminal:

- When a file is successfully copied from `input` to `output`.
- If a file already exists in the `output` folder.
- If a file is missing in the `input` folder corresponding to a file in the `referenz` folder.

At the end of the execution, a list of missing files (files present in `referenz` but not found in `input`) will be displayed.

## Example

Consider the following scenario:

- `referenz` contains: `IMG_0010-scaled.jpeg`, `IMG_0020.jpg`, `IMG_0030-1.jpeg`
- `input` contains: `IMG_0010.jpeg`, `IMG_0030.jpeg`
- `output` is initially empty.

Running the script will result in:

- `IMG_0010.jpeg` is copied to `output`.
- `IMG_0030.jpeg` is copied to `output`.
- A message stating `IMG_0020` is missing from `input`.

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Developed by [Your Name].

Feel free to suggest improvements or report bugs by opening an issue.
