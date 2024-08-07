# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY app.py .

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose port 5000 for Flask
EXPOSE 5000

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]