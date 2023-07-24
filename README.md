Hello! You can set up the platform either with Docker or locally. Choose the method that suits your preferences and requirements :)

## Set Up with Docker

To set up using Docker, follow these steps:

1. Install Docker on your machine if you haven't already. Refer to the Docker documentation for detailed installation instructions: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

2. Clone the Movie API repository from GitHub:

```git clone git@github.com:cboliveiras/movie-api.git```

3. Navigate to the project directory:

```cd movie-api```

4. Build the Docker image:

```docker-compose build```

5. Run the Docker container:

```docker-compose up```

6. Create the database, run the migrations and create the seeds:

```docker-compose run web rake db:drop db:create db:migrate```

1. The API should now be accessible at [http://localhost:3000](http://localhost:3000)

2. Run the tests:

```docker-compose run web rake spec PGUSER=postgres RAILS_ENV=test```

9. If you want, open a bash session inside the container:

```docker exec -it movie-api_web_1 bash```

## Set Up Locally

To set up the project locally, follow these steps:

1. Install Ruby 2.7.4 or later on your machine. You can use a version manager like RVM or rbenv to manage your Ruby installations.

2. Clone the Movie API repository from GitHub:

```git clone git@github.com:cboliveiras/movie-api.git```

3. Navigate to the project directory:

```cd movie-api```

4. Install the required gems:

```bundle install```

5. The database.yml file is originally configured to use Docker. If you want to run the application locally, you have to update to:

```
default: &default
  adapter: postgresql
  encoding: unicode

development:
  <<: *default
  database: movie-api_development

test:
  <<: *default
  database: movie-api_test
```

Or just comment lines 4-9.

6. Set up the database:

```rails db:create db:migrate```

1. Start the Rails server:

```rails s```

8. The API should now be accessible at [http://localhost:3000](http://localhost:3000)

9. Run all tests:

```rspec spec```

## API Documentation

The API documentation is available at [API Documentation File](https://github.com/cboliveiras/movie-api/blob/main/API_Documentation.md). It provides detailed information about all the available endpoints, including request formats, parameters, and responses.

## Postman Collection

Test the endpoints on [Postman](https://cboliveiras.postman.co/workspace/New-Team-Workspace~1b824ad1-9e36-4ad8-a727-9110ae009b69/collection/18541010-3e899614-cf87-4d3d-bdfe-1adb9fb1b59d?action=share&creator=18541010)

You can also find the Postman documentation [here](https://documenter.getpostman.com/view/18541010/2s93z6ejma)

