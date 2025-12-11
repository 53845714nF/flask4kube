# Flask4Kube

A minimalistic Flask application for testing load balancers in Kubernetes clusters.

## Overview

Flask4Kube is a simple web application that returns the hostname of the server it's running on.
This makes it ideal for testing and verifying Kubernetes load balancing, as each request shows which pod handled the request.

## Features

- Lightweight Flask application
- Returns server hostname as HTTP response
- Containerized with Alpine Linux for minimal image size
- Production-ready setup with Gunicorn WSGI server
- Complete Kubernetes configuration included:
  - Deployment with configurable replicas
  - LoadBalancer Service
  - Ingress with Traefik

## Prerequisites

- Docker (for local development)
- Kubernetes Cluster (for deployment)
- kubectl configured for your cluster

## Quick Start

### Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Start the app
python -m flask --app app run --port 8000
```

The application will be available at `http://localhost:8000`.

### With Docker

```bash
# Build Docker image
docker build -t flask4kube:latest .

# Run container
docker run -p 8000:8000 flask4kube:latest
```

## Kubernetes Deployment

### Deploy

```bash
# Apply Kubernetes resources
kubectl apply -f flask4kube.yml
```

### Configuration

The `flask4kube.yml` contains:

**Deployment:**
- 2 Replicas (adjustable)
- Resource Limits: 128Mi Memory, 500m CPU
- Resource Requests: 64Mi Memory, 100m CPU
- Image Pull Policy: Always

**Service:**
- Type: LoadBalancer
- Port: 81 (external) → 8000 (internal)
- Configurable external IPs

**Ingress:**
- Ingress Class: Traefik
- Path: `/`

## Technology Stack

- **Flask**: Web framework
- **Gunicorn**: WSGI HTTP server
- **Alpine Linux**: Base Docker image
- **Kubernetes**: Container orchestration
- **Traefik**: Ingress controller
