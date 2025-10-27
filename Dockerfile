# Dockerfile - correct for your repo layout (app/ contains main.py)
FROM python:3.11-slim

# create app dir and set it as workdir
WORKDIR /app

# copy requirements and install
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy application files into /app
COPY app/ /app/

# expose the port app listens on
EXPOSE 8080

# start uvicorn using module path that matches this layout
# since /app contains main.py, use "main:app"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
