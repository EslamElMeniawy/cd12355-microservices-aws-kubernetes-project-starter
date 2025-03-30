FROM python:3.10-slim-buster

# Install required system dependencies in a single layer
RUN apt update -y && apt install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel

# Copy requirements and install
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY __init__.py __init__.py
COPY config.py config.py
COPY app.py app.py

# Default command
CMD ["python", "app.py"]