FROM postgres:13

# Install curl
RUN apt-get update && apt-get install -y curl

# Download the Pagila schema and data SQL files using curl with SSL certificate verification disabled
WORKDIR /tmp
RUN curl -k -L -o pagila-schema.sql https://raw.githubusercontent.com/devrimgunduz/pagila/master/pagila-schema.sql
RUN curl -k -L -o pagila-data.sql https://raw.githubusercontent.com/devrimgunduz/pagila/master/pagila-data.sql

# Move the Pagila scripts to the init directory
RUN mv pagila-schema.sql /docker-entrypoint-initdb.d/01-pagila-schema.sql
RUN mv pagila-data.sql /docker-entrypoint-initdb.d/02-pagila-data.sql

# Create a file to create the postgres role
RUN echo "CREATE ROLE postgres LOGIN SUPERUSER;" > /docker-entrypoint-initdb.d/00-create-role.sql

WORKDIR /
