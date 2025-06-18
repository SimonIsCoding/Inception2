# Inception

## Overview
Inception is a system administration project that focuses on setting up a small infrastructure composed of different services under specific rules. The project uses Docker containers to create a virtual machine that runs various services including NGINX, WordPress, and MariaDB.

## Prerequisites
- Docker
- Docker Compose
- Make (for using the Makefile)

## Required Configuration

### 1. Environment Variables
Create a `.env` file in the `srcs` directory with the following variables:
```bash
# Database configuration
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=wordpress
MYSQL_USER=your_wordpress_user
MYSQL_PASSWORD=your_wordpress_password

# WordPress configuration
WP_ADMIN_USER=your_admin_username
WP_ADMIN_PASSWORD=your_admin_password
WP_ADMIN_EMAIL=your_email@example.com

# Domain configuration
DOMAIN_NAME=your_domain_name
```

### 2. Host Configuration
Add the following line to your `/etc/hosts` file:
```bash
127.0.0.1 your_domain_name
```

To edit the hosts file, you can use:
```bash
sudo nano /etc/hosts
```

Replace `your_domain_name` with the same value you used in the `.env` file.

### 3. SSL Certificate
The project requires SSL certificates for HTTPS. You need to:
1. Generate SSL certificates for your domain
2. Place them in the appropriate directory (usually `srcs/requirements/nginx/tools/`)

You can generate self-signed certificates using:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout private.key -out certificate.crt
```

## Project Structure
```
.
├── srcs/
│   ├── docker-compose.yml
│   └── requirements/
├── Makefile
└── README.md
```

## Getting Started

### Installation
1. Clone the repository:
```bash
git clone <repository-url>
cd Inception
```

2. Build and start the containers:
```bash
make
```

### Available Make Commands
- `make`: Build and start all containers
- `make build`: Build the containers
- `make up`: Start the containers
- `make down`: Stop and remove containers
- `make clean`: Remove all containers and volumes
- `make fclean`: Remove all containers, volumes, and images
- `make re`: Rebuild all containers

## Services

### NGINX
- Web server running on port 443 (HTTPS)
- Handles SSL/TLS encryption
- Serves WordPress content

### WordPress
- Content Management System
- Connected to MariaDB
- Accessible through NGINX

### MariaDB
- Database server
- Stores WordPress data
- Runs on port 3306

## Docker Configuration
The project uses Docker Compose to manage multiple containers. The configuration is defined in `srcs/docker-compose.yml`.

### Container Specifications
- All containers are built from Debian Buster
- Each service runs in its own container
- Containers are connected through a Docker network

## Security
- SSL/TLS encryption is implemented
- Services are properly isolated in containers
- Database credentials are managed securely

## Usage
1. After starting the containers, you can access:
   - WordPress: https://localhost
   - MariaDB: localhost:3306

2. Default credentials:
   - WordPress admin credentials are set during container initialization
   - MariaDB credentials are configured in the environment variables

## Troubleshooting
If you encounter any issues:
1. Check if all containers are running:
```bash
docker ps
```

2. View container logs:
```bash
docker-compose logs
```

3. Restart the containers:
```bash
make re
```

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request
