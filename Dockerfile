# Multi-stage build to reduce image size
FROM python:3.12-slim as builder

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements-prod.txt .
RUN pip install --no-cache-dir --user -r requirements-prod.txt

# Final stage - minimal runtime image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy only installed packages from builder
COPY --from=builder /root/.local /root/.local

# Copy application code (only what's needed)
COPY app.py .
COPY src/ ./src/
COPY models/ ./models/
COPY templates/ ./templates/
COPY static/ ./static/

# Make sure scripts in .local are usable
ENV PATH=/root/.local/bin:$PATH

# Expose port
EXPOSE 8080

# Run the app
CMD ["python", "app.py"]
