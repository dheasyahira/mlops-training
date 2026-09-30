FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY scripts/serve.py .

COPY mlruns/2/models/m-c9fc92cab0b74c0f8ca6f700a502a033/artifacts ./model

EXPOSE 8080

CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8080"]