## docker-flask-template
This is a basic docker container template, containing a Flask app and a Postgres database both registered as services in a docker-compose.

Since both containers belong to the same default network, Flask app is able to see the database.

In addition, after creating the images, both images are pushed into dockerhub, so they are used in /kubernetes solution(check the folder within the repository).

Given the docker-compose file, I used kompose in order to export all the kubernetes manifests needed in order to install and scale up the containers previously mentioned.

Finally, within /terraform, there are templates for installing(in a single gcp instance), all the services defined in docker-compose.

# In order to startup the containers, please run:

docker-compose -f docker-compose.yaml up --no-start

docker-compose -f docker-compose.yaml start

# and to stop the containers:

docker-compose -f docker-compose.yaml stop

# Stop and remove containers, networks..
docker-compose -f docker-compose.yaml down

# Scaling up/down containers by using Kubernetes
Minikube was used in order to emulate a kubernetes cluster locally. 
Kubectl is also installed in order to interact with Kubernetes master.
https://kubernetes.io/docs/tasks/tools/
Once Minikube is downloaded, It can be started by executing
minikube start

# Deploying all the pods
kubectl apply -f db-deployment.yaml
kubectl apply -f flask-deployment.yaml
kubectl apply -f db-claim0-persistentvolumeclaim.yaml

# Installing the services
kubectl apply -f db-service.yaml
kubectl apply -f flask-service.yaml


# Forwarding the ports for accesing 
kubectl port-forward svc/flask 5000:5000
kubectl port-forward svc/db 5432:5432

# Download Terraform
https://www.terraform.io/

# Create resources
terraform apply

# Destroy resources 
terraform destroy