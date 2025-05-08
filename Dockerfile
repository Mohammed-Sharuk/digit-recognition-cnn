# Use official Python 3.8 base image 
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy project files to the container
COPY . .

# Fix for apt hash sum mismatch error and install build-essential
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update --allow-releaseinfo-change && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose Flask port
EXPOSE 5000

# Start the Flask app
CMD ["python", "app.py"]
