#!/bin/bash
mkdir -p /data/ollama /data/hf data/uploaded_pdfs db/chroma_db

# start Ollama and download phi3 in the background
ollama serve &
(sleep 5 && ollama pull phi3) &

# start the web app right away so Render sees the port open
streamlit run app.py --server.port=${PORT:-8501} --server.address=0.0.0.0