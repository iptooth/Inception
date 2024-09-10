# Inception Project - 42 School

Welcome to my **Inception** project! This project is part of the curriculum at **42 School** and involves setting up a complex infrastructure using **Docker** containers to host various services. Each service runs in its own dedicated container, ensuring modularity and ease of management. 

## Project Overview

The objective of the Inception project is to implement a scalable, multi-container architecture using Docker, where each service is isolated in its own container. The services included in this setup are:

- **Nginx** (Web server)
- **WordPress** (Content Management System)
- **MariaDB** (Database for WordPress)
- **Adminer** (Database management tool)
- **Fail2ban** (Intrusion prevention software)
- **FTP** (File Transfer Protocol server)
- **Redis** (In-memory data structure store)
- **Custom Website** (Hosted on Nginx with WordPress)

### Key Objectives
- Use **Docker Compose** to orchestrate multiple containers.
- Set up persistent storage using Docker volumes.
- Ensure all containers can communicate securely with each other.
- Implement security best practices, including the configuration of **Fail2ban**.
- Deploy and manage a **WordPress** site with a **MariaDB** database backend.

## Project Architecture

The architecture is designed so that each service runs in its own Docker container:


### Description of Services

- **Nginx**: A high-performance web server and reverse proxy used to serve the WordPress site and the custom website.
  
- **WordPress**: A popular open-source CMS platform, running in a separate container with a backend powered by the MariaDB database.

- **MariaDB**: A relational database used to store data for the WordPress site.

- **Adminer**: A lightweight, easy-to-use database management tool to interact with the MariaDB instance.

- **Fail2ban**: Provides basic protection from brute-force attacks by monitoring log files and banning IP addresses that show malicious behavior.

- **FTP**: A containerized FTP server that allows secure file transfers.

- **Redis**: Acts as a cache for the WordPress site, improving performance by storing frequently accessed data.

- **Custom Website**: Another static or dynamic website hosted separately on the Nginx server.

## Getting Started

### Prerequisites

Before running this project, ensure you have the following installed on your machine:

- Docker
- Docker Compose

### Installation & Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/inception.git
    cd inception
    ```

2. Create the necessary directories for persistent volumes:

    ```bash
    mkdir -p data/nginx data/wordpress data/mariadb data/redis
    ```

3. Build and start the containers:

    ```bash
    docker-compose up --build
    ```

4. Access the services:

    - **WordPress**: Visit `http://localhost` to see the WordPress site.
    - **Adminer**: Access the Adminer interface at `http://localhost:8080` to manage the MariaDB database.
    - **Custom Website**: Visit `http://localhost:YOUR_CUSTOM_PORT` to view your additional website.
    - **FTP**: Connect to the FTP server at `ftp://localhost:YOUR_FTP_PORT`.
    - **Fail2ban**: Check the container logs to monitor for banned IPs.

### Configuration

You can adjust environment variables and configurations by editing the `docker-compose.yml` file and the respective configuration files for each service.

## Project Structure

```bash
.
├── docker-compose.yml          # Docker Compose file
├── nginx/                      # Nginx configuration
├── wordpress/                  # WordPress configuration
├── mariadb/                    # MariaDB configuration
├── adminer/                    # Adminer configuration
├── fail2ban/                   # Fail2ban configuration
├── ftp/                        # FTP server configuration
├── redis/                      # Redis configuration
└── custom_website/             # Custom website files
