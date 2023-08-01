# Running Laravel Application with Docker

This guide will walk you through the steps to run a Laravel application using Docker. Before proceeding, ensure that you have Docker and Docker Compose installed on your system.

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone the Laravel application repository to your local machine.
2. Move your Laravel application inside the 'src' folder.

## Docker Compose Configuration

The `docker-compose.yml` file defines three services: `laravel_app`, `db`, and `phpmyadmin`. The services are as follows:

- `laravel_app`: This service is responsible for running the Laravel application using the `bitnami/laravel` image. It also depends on the `db` service, which is the MySQL database container. The application will be accessible on port 8000.

- `db`: This service runs a MySQL database container with the required environment variables for the Laravel application.

- `phpmyadmin`: This service sets up a PHPMyAdmin container to manage the MySQL database. It depends on the `db` service and is accessible on port 8080.

## Dockerfile Configuration

The provided `Dockerfile` uses the `bitnami/laravel` base image to build the Laravel application container. It sets the working directory to `/var/www/html`, copies the Laravel application source code, installs Composer dependencies, and generates an application key. The container exposes port 8000 for the Laravel application to run.

## Steps to Run the Laravel Application

1. Open a terminal or command prompt and navigate to the root directory of your Laravel application.

2. Build the Docker containers by running the following command:

   ```bash
   docker-compose build
   ```

3. Once the build process is complete, start the containers with the following command:

   ```bash
   docker-compose up -d
   ```

   The `-d` flag runs the containers in the background.

4. The Laravel application should now be running in the background. You can access it in your web browser at `http://localhost:8000`.

5. To stop the containers, use the following command:

   ```bash
   docker-compose down
   ```

   This will stop and remove the containers, but the data will persist due to the use of volumes.

## Accessing PHPMyAdmin

PHPMyAdmin is running on port 8080. To access it, open your web browser and go to `http://localhost:8080`. Use the MySQL credentials specified in the `docker-compose.yml` file to log in.

## Application Data Persistence

The MySQL data is stored in a Docker volume named `db-data`. This ensures that the data persists even if you stop or remove the containers.

## Customization

- If your Laravel application uses additional services or configuration, you can modify the `docker-compose.yml` file and the `Dockerfile` accordingly.

- For production use, consider using a `.env` file to manage sensitive configuration values and mounting it as a volume in the `laravel_app` service.

- Make sure to configure proper security measures, especially if deploying the application in a production environment.

## Troubleshooting

If you encounter any issues during the setup or execution of the Laravel application with Docker, refer to the Docker and Docker Compose documentation or search for solutions on community forums.

Congratulations! You have successfully set up and run your Laravel application using Docker. Happy coding!
