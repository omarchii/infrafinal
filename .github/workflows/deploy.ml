name: Deploy Flask App to Azure

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Log in to Azure Container Registry
      uses: azure/docker-login@v1
      with:
        login-server: infrafinal.azurecr.io
        username: ${{ secrets.AZURE_USERNAME }}
        password: ${{ secrets.AZURE_PASSWORD }}

    - name: Build and push Docker image
      run: |
        docker build -t infrafinal.azurecr.io/flask-backend:${{ github.sha }} .
        docker push <tu-acr>.azurecr.io/flask-backend:${{ github.sha }}

    - name: Deploy to Azure Web App
      uses: azure/webapps-deploy@v2
      with:
        app-name: finalfinal
        images: infrafinal.azurecr.io/flask-backend:${{ github.sha }}
