
# Pagila Database Docker Setup

## Overview
This Docker setup provides a PostgreSQL server loaded with the Pagila sample database and pgAdmin for database management. The Pagila database is a PostgreSQL port of the MySQL Sakila sample database, featuring a DVD rental store schema.

## Prerequisites
- Docker installed on your machine.
- Docker Compose installed on your machine.

## Quick Start
1. **Clone the repository**: Clone or download this repository to your local machine.

2. **Navigate to the directory**: Change to the directory containing the `docker-compose.yml` file and the Dockerfile.

3. **Build and Run**: Execute the following command to start the PostgreSQL server and pgAdmin:
   ```
   docker-compose up --build
   ```
   This command builds the PostgreSQL image with the Pagila database and starts the containers.

## Accessing pgAdmin
- **URL**: After starting the Docker containers, pgAdmin can be accessed via a web browser at `http://localhost:80`.

- **Login**: Use the following default credentials, unless you've changed them in the `docker-compose.yml` file:
  - Email: `admin@admin.com`
  - Password: `root`

- **Connect to PostgreSQL**:
  1. In pgAdmin, right-click on 'Servers' in the left-hand pane and select 'Create' > 'Server'.
  2. In the 'Create Server' window, enter the following details:
     - General:
       - Name: `Pagila Server` (or any name you prefer)
     - Connection:
       - Host: `postgres` (name of the Docker service)
       - Port: `5432` (default PostgreSQL port)
       - Maintenance database: `pagila`
       - Username: `user` (or as specified in `docker-compose.yml`)
       - Password: `password` (or as specified in `docker-compose.yml`)
  3. Click 'Save'.

## Using the Pagila Database
The Pagila database is a complex database schema representing a DVD rental store. It contains tables like `film`, `actor`, `customer`, `store`, `rental`, and more, which can be used to run queries, test database functions, and practice SQL.

Feel free to explore the schema and run queries through pgAdmin's query tool or connect using any PostgreSQL client.

## Stopping the Containers
To stop the Docker containers, run the following command in the directory containing your `docker-compose.yml` file:
```
docker-compose down
```
