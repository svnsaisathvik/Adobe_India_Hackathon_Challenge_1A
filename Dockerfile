# syntax=docker/dockerfile:1
FROM --platform=linux/amd64 python:3.10-slim

# Set work directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the script
COPY modified_pdf_extractor.py ./

# ENTRYPOINT: process all PDFs in /app/input and output to /app/output
ENTRYPOINT ["python", "modified_pdf_extractor.py"] 