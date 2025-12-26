#!/bin/bash

# Movie Sentiment Classification - Docker Deployment Script

echo "🎬 Movie Sentiment Classification - Docker Deployment"
echo "=================================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is available
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "❌ Docker Compose is not available. Please install Docker Compose."
    exit 1
fi

echo "✅ Docker is installed and ready"

# Build and run the application
echo "🔨 Building Docker image..."
docker-compose build

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully"
else
    echo "❌ Failed to build Docker image"
    exit 1
fi

echo "🚀 Starting the application..."
docker-compose up -d

if [ $? -eq 0 ]; then
    echo "✅ Application started successfully!"
    echo ""
    echo "🌐 Access your application at: http://localhost:8501"
    echo ""
    echo "📋 Useful commands:"
    echo "  • View logs: docker-compose logs -f"
    echo "  • Stop app: docker-compose down"
    echo "  • Restart: docker-compose restart"
    echo "  • View status: docker-compose ps"
else
    echo "❌ Failed to start the application"
    exit 1
fi