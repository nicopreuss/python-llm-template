# ---- Base image ----
    FROM python:3.11-slim

    # Install uv (fast package manager)
    RUN pip install --no-cache-dir uv
    
    # Set work directory
    WORKDIR /app
    
    # Copy project files into the container
    COPY . .
    
    # Create virtual environment inside container & install project + dev deps
    RUN uv venv .venv && \
        uv pip install -e ".[dev]"
    
    # Expose FastAPI default port
    EXPOSE 8000
    
    # Run FastAPI with uvicorn
    CMD ["uv", "run", "uvicorn", "python_llm_template.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
    