FROM ubuntu:16.04

MAINTAINER "marcos.mussio@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev && \
    apt-get install -y iputils-ping && \
    apt-get install netcat -y

# We copy just the requirements.txt first to leverage Docker cache
COPY ./flask_project/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY flask_project /app/flask_project

ENTRYPOINT [ "python" ]

CMD [ "./flask_project/flask_service.py" ]