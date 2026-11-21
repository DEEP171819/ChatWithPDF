FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl zstd && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://ollama.com/install.sh | sh

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN sed -i 's/\r$//' start.sh

ENV OLLAMA_MODELS=/data/ollama
ENV HF_HOME=/data/hf
EXPOSE 8501
CMD ["bash", "start.sh"]