FROM bluelens/python:3.6
MAINTAINER bluehackmaster <master@bluehack.net>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

ENV GRPC_PYTHON_VERSION 1.7.0
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*
RUN pip install grpcio==${GRPC_PYTHON_VERSION} grpcio-tools==${GRPC_PYTHON_VERSION}

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]