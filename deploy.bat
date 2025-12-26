@echo off
REM Movie Sentiment Classification - Docker Deployment Script for Windows

echo 🎬 Movie Sentiment Classification - Docker Deployment
echo ==================================================

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not installed. Please install Docker Desktop first.
    echo Visit: https://docs.docker.com/desktop/windows/install/
    pause
    exit /b 1
)

echo ✅ Docker is installed and ready

REM Build and run the application
echo 🔨 Building Docker image...
docker-compose build

if %errorlevel% equ 0 (
    echo ✅ Docker image built successfully
) else (
    echo ❌ Failed to build Docker image
    pause
    exit /b 1
)

echo 🚀 Starting the application...
docker-compose up -d

if %errorlevel% equ 0 (
    echo ✅ Application started successfully!
    echo.
    echo 🌐 Access your application at: http://localhost:8501
    echo.
    echo 📋 Useful commands:
    echo   • View logs: docker-compose logs -f
    echo   • Stop app: docker-compose down
    echo   • Restart: docker-compose restart
    echo   • View status: docker-compose ps
    echo.
    pause
) else (
    echo ❌ Failed to start the application
    pause
    exit /b 1
)