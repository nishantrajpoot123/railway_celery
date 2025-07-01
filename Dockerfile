FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV C_FORCE_ROOT=true

# This is where your Celery app lives — adjust if needed
CMD ["celery", "-A", "tasks.celery_app", "worker", "--loglevel=info"]
