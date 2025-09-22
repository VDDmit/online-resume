FROM python:3.11-slim
WORKDIR /app

# зависимости
COPY app/requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt

# код + статика
COPY app/main.py ./main.py
COPY app/static ./static



EXPOSE 8000
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]