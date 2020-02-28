FROM python:3-alpine
MAINTAINER Shahar Levin

RUN apk add --no-cache python3-dev libffi-dev build-base openssl-dev mysql
COPY example/requirements.txt /tmp/
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY example /usr/src/app

# Expose the Flask port
EXPOSE 5000

CMD [ "python3", "app.py"]