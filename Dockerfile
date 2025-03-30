FROM python:3.10-slim-buster

# Install required system dependencies in a single layer
RUN apt update -y && apt install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel

# Copy requirements and install
COPY ./analytics/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY ./analytics .

# Default command
CMD ["python", "app.py"]