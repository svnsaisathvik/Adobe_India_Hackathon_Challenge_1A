# PDF Outline Extractor Solution

## Approach
This solution is designed to automatically extract structured outlines from PDF documents. The main script, `modified_pdf_extractor.py`, processes all PDF files in a specified input directory and generates a corresponding JSON file for each PDF in the output directory. Each output JSON contains the extracted title and a hierarchical outline of headings found in the document.

The extraction approach combines:
- **Text and font analysis:** Extracts text, font size, style (bold/italic), and position from each page.
- **Heuristic rules:** Identifies titles and headings based on font size, position, formatting, and text patterns.
- **Statistical analysis:** Determines significant font sizes to distinguish headings from body text.

The solution is robust to a variety of PDF layouts and does not require any pre-trained machine learning models.

## Models and Libraries Used
- **[PyMuPDF (pymupdf)](https://pymupdf.readthedocs.io/):**
  - Used for parsing PDF files and extracting text, font, and layout information.
- **Standard Python libraries:**
  - `os`, `json`, `re`, `time`, `statistics`, `pathlib`, `collections`

No external machine learning models are used; the logic is rule-based and statistical.

## How to Build and Run

### 1. Prepare Your Workspace
- Place all input PDF files in an `input` directory at the root of your project.
- Ensure there is an empty `output` directory at the root (the script will write JSON files here).

### 2. Build the Docker Image
```sh
docker build --platform linux/amd64 -t mysolutionname:somerandomidentifier .
```

### 3. Run the Docker Container
```sh
docker run --rm -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output --network none mysolutionname:somerandomidentifier
```
- On Windows Command Prompt, use `%cd%` instead of `$(pwd)` and wrap the paths in quotes if there are spaces:
  ```cmd
  docker run --rm -v "%cd%\input:/app/input" -v "%cd%\output:/app/output" --network none mysolutionname:somerandomidentifier
  ```

### 4. Output
- For each `filename.pdf` in `input`, a corresponding `filename.json` will be created in `output`.
- Each JSON contains the extracted title and outline.

## File Overview
- **modified_pdf_extractor.py**: Main script for PDF outline extraction.
- **requirements.txt**: Lists required Python packages (PyMuPDF).
- **Dockerfile**: Defines the container environment and entrypoint.

---

**Note:**
- All dependencies are installed within the Docker container during build.
- The solution is fully compatible with the "Expected Execution" commands provided in the evaluation instructions. 