# Dockerfile
FROM python:3.11-slim

WORKDIR /app

# Copy and install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your FastAPI app code
COPY app /app

# Expose the port FastAPI runs on
EXPOSE 8080

# Run the FastAPI app (note the updated import path)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
