# Inception

Welcome to **Inception**, a Docker-based project developed as part of the 42 School curriculum. The goal of this project is to set up a multi-service infrastructure using Docker containers, each running a specific service. These services include Nginx, WordPress, MariaDB, Adminer, Fail2ban, FTP, Redis, and a custom website, all isolated in their own containers.

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Services](#services)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## About the Project

The **Inception** project is designed to introduce students to the fundamentals of containerization and service orchestration using **Docker**. Each service runs in its own Docker container, ensuring that the infrastructure is modular, scalable, and easy to maintain. The project focuses on implementing a secure and isolated environment for a multi-service web infrastructure.

### Key Objectives:
- Set up multiple services, each in a dedicated Docker container.
- Ensure communication between services using Docker networks.
- Implement persistent storage for services like WordPress and MariaDB.
- Follow security best practices by setting up **Fail2ban** to protect against brute-force attacks.

## Features

- **Multi-container Setup**: Each service is deployed in its own isolated Docker container.
- **Nginx**: Acts as a reverse proxy and web server for the WordPress site and the custom website.
- **WordPress**: A CMS with a backend powered by MariaDB.
- **MariaDB**: A relational database used to store WordPress data.
- **Adminer**: A lightweight database management tool.
- **Fail2ban**: Provides basic protection from brute-force attacks.
- **FTP Server**: A containerized FTP service to allow file transfers.
- **Redis**: Caches data to improve performance.
- **Custom Website**: A separate site hosted on the Nginx container.

## Installation

To set up and run **Inception**, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/inception.git
    cd Inception
    ```

2. **Create necessary directories for persistent data**:
    ```bash
    mkdir -p /home/$USER/data/wp_db /home/$USER/data/wp_files /home/$USER/data/ftp_logs /home/$USER/data/shared
    ```

3. **Start the Docker containers**:
    ```bash
    docker-compose up --build
    ```

4. **Access the services**:
   - WordPress: `https://localhost`
   - Adminer: `http://localhost:8080`
   - Custom Website: `http://localhost:3000`
   - FTP: Connect via `ftp://localhost:21` (FTP client required)

## Usage

Once the containers are up and running, you can access the different services:

- **WordPress**: A fully functioning CMS where you can create content, manage posts, and interact with MariaDB as the backend.
- **Adminer**: A web-based database management interface for MariaDB. Login using the credentials defined in the `.env` file.
- **Fail2ban**: Automatically monitors and blocks malicious IP addresses. Check logs for banned IPs.
- **FTP**: Connect using any FTP client to transfer files between your local machine and the server.
- **Redis**: Acts as a cache to enhance WordPress performance.
- **Custom Website**: A separate custom website that runs on Nginx and can be accessed via `http://localhost:3000`.

### Example Commands:

```bash
# Start the Docker services
docker-compose up --build

# Stop the Docker services
docker-compose down

# View the logs for a specific container (e.g., Nginx)
docker logs nginx

# Check for blocked IPs in Fail2ban
docker logs fail2ban
