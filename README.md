# TENTEK Products

## Overview

Welcome to the TENTEK Products repository! This project is a web application built using Python and FastAPI, designed to manage products, users, orders, and payments. It is structured to be deployed using Docker and Kubernetes, with continuous integration and deployment pipelines set up via GitHub Actions.

## Features

- **Product Management**: Create, read, and update product information, including stock levels.
- **User Management**: Handle user data and authentication.
- **Order Processing**: Manage orders and order items.
- **Payment Handling**: Process payments for orders.
- **Microservices Architecture**: Utilizes RabbitMQ for message queuing and Redis for caching.

## Project Structure

- **src/**: Contains the main application code, including models, routes, and business logic.
- **alembic/**: Manages database migrations.
- **Dockerfile**: Defines the Docker image for the application.
- **.github/workflows/**: Contains CI/CD pipeline configurations using GitHub Actions.

## Getting Started

### Prerequisites

- Python 3.10
- Docker
- PostgreSQL
- Redis
- RabbitMQ

### Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/romedikc/to-do-app
   cd to-do-app
   ```

2. **Create a Virtual Environment**:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Dependencies**:
   ```bash
   pip install -r src/requirements.txt
   ```

4. **Set Up the Database**:
   - Create a new PostgreSQL database and update the `.env` file with your database credentials.

5. **Run Migrations**:
   ```bash
   alembic upgrade head
   ```

### Running the Application

- **Locally**:
  ```bash
  uvicorn src.books.main:app --reload
  ```

- **Using Docker**:
  ```bash
  docker-compose up --build
  ```

## Docker and Helm

### Docker

The application is containerized using Docker. The `Dockerfile` is a multi-stage build that first installs dependencies and then copies the application code into a slim Python image.

- **Build the Docker Image**:
  ```bash
  docker build -t tntk-products .
  ```

- **Run the Docker Container**:
  ```bash
  docker run -p 8000:8000 tntk-products
  ```

### Helm

Helm is used to manage Kubernetes deployments. The CI/CD pipeline updates the Helm chart with the latest Docker image tags and deploys it to the Kubernetes cluster.

- **Helm Chart Update**:
  - The GitHub Actions workflow updates the Helm chart with the new Docker image tag whenever changes are pushed to the `main` or `stage` branches.

## Continuous Integration and Deployment

The project uses GitHub Actions for CI/CD. The workflow defined in `.github/workflows/ci.yml` automates the following:

- **Build and Push Docker Images**: Builds Docker images for `stage` and `main` branches and pushes them to Amazon ECR.
- **Update Helm Manifests**: Updates Kubernetes manifests with the new Docker image tags.
- **Deploy to Kubernetes**: Automatically deploys the updated Helm chart to the Kubernetes cluster.

## Contributing

We welcome contributions! Please fork the repository and submit a pull request with your changes. Ensure that your code passes all tests and adheres to the project's coding standards.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

This README provides a high-level overview of the project and should help new students get started with understanding and contributing to the codebase. If you have any questions, feel free to reach out to the maintainers.
