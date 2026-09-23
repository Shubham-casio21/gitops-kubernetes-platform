FROM python:3.12-slim
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/app.py .
RUN useradd -r -u 10001 appuser
USER appuser
EXPOSE 8080
CMD ["python","app.py"]
