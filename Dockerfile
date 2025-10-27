# Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app /app

# Use uvicorn to serve
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
EXPOSE 8080
