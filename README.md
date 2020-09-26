# docker-flask-template
This is a basic template of a docker container, containing a Flask app and a postgres database both registered in a docker-compose.

Since both containers belong to the same default network, Flask app can see the database.

# In order to startup the containers, please run:

docker-compose -f docker-compose.yaml up --no-start

docker-compose -f docker-compose.yaml start

# and to stop the containers:

docker-compose -f docker-compose.yaml stop

# Stop and remove containers, networks..
docker-compose -f docker-compose.yaml down