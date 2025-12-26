# 🐳 Docker Deployment Guide

This guide explains how to deploy the Movie Sentiment Classification app using Docker.

## Prerequisites

- **Docker Desktop** installed on your system
  - Windows: [Download Docker Desktop](https://docs.docker.com/desktop/windows/install/)
  - macOS: [Download Docker Desktop](https://docs.docker.com/desktop/mac/install/)
  - Linux: [Install Docker Engine](https://docs.docker.com/engine/install/)

## Quick Start

### Option 1: Automated Deployment (Recommended)

**Windows:**
```bash
deploy.bat
```

**Linux/macOS:**
```bash
chmod +x deploy.sh
./deploy.sh
```

### Option 2: Manual Deployment

1. **Build the Docker image:**
```bash
docker-compose build
```

2. **Start the application:**
```bash
docker-compose up -d
```

3. **Access the app:**
Open your browser and go to: `http://localhost:8501`

## Docker Commands

### Basic Operations
```bash
# Start the application
docker-compose up -d

# Stop the application
docker-compose down

# View logs
docker-compose logs -f

# Restart the application
docker-compose restart

# Check status
docker-compose ps
```

### Advanced Operations
```bash
# Rebuild and restart
docker-compose up --build -d

# Remove everything (including volumes)
docker-compose down -v

# Access container shell
docker-compose exec sentiment-classifier bash

# View resource usage
docker stats movie-sentiment-app
```

## Configuration

### Environment Variables
You can modify these in `docker-compose.yml`:

- `STREAMLIT_SERVER_PORT`: Port for the web app (default: 8501)
- `STREAMLIT_SERVER_ADDRESS`: Server address (default: 0.0.0.0)
- `STREAMLIT_BROWSER_GATHER_USAGE_STATS`: Disable usage stats (default: false)

### Port Configuration
To change the port, modify `docker-compose.yml`:
```yaml
ports:
  - "8080:8501"  # Access via http://localhost:8080
```

## Troubleshooting

### Common Issues

**1. Port already in use:**
```bash
# Check what's using port 8501
netstat -tulpn | grep 8501

# Use different port
docker-compose down
# Edit docker-compose.yml to change port
docker-compose up -d
```

**2. Docker build fails:**
```bash
# Clean Docker cache
docker system prune -a

# Rebuild from scratch
docker-compose build --no-cache
```

**3. Application won't start:**
```bash
# Check logs
docker-compose logs sentiment-classifier

# Check container status
docker-compose ps
```

**4. Out of memory:**
```bash
# Increase Docker memory limit in Docker Desktop settings
# Or use smaller dataset in app.py
```

### Performance Optimization

**1. Reduce image size:**
- Models are cached in `./models` directory
- First run trains models, subsequent runs load from cache

**2. Resource limits:**
Add to `docker-compose.yml`:
```yaml
deploy:
  resources:
    limits:
      memory: 1G
      cpus: '0.5'
```

## Production Deployment

### Using Docker Swarm
```bash
docker swarm init
docker stack deploy -c docker-compose.yml sentiment-app
```

### Using Kubernetes
```bash
# Convert docker-compose to k8s
kompose convert
kubectl apply -f .
```

### Cloud Deployment

**AWS ECS:**
1. Push image to ECR
2. Create ECS task definition
3. Deploy to ECS cluster

**Google Cloud Run:**
```bash
gcloud run deploy --image gcr.io/PROJECT/sentiment-app --port 8501
```

**Azure Container Instances:**
```bash
az container create --resource-group myRG --name sentiment-app --image myregistry/sentiment-app
```

## Security Considerations

1. **Don't expose sensitive data** in environment variables
2. **Use secrets management** for production
3. **Run as non-root user** (already configured in Dockerfile)
4. **Keep base images updated** regularly

## Monitoring

### Health Checks
The container includes health checks:
```bash
# Manual health check
curl http://localhost:8501/_stcore/health
```

### Logs
```bash
# Follow logs in real-time
docker-compose logs -f

# Export logs
docker-compose logs > app.log
```

## Backup and Recovery

### Backup trained models
```bash
# Models are stored in ./models directory
tar -czf models-backup.tar.gz models/
```

### Restore models
```bash
tar -xzf models-backup.tar.gz
docker-compose restart
```

## Support

If you encounter issues:
1. Check the logs: `docker-compose logs -f`
2. Verify Docker installation: `docker --version`
3. Check available resources: `docker system df`
4. Review this guide for troubleshooting steps

---

**Happy Deploying! 🚀**