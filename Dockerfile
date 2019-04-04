FROM python:2.7-alpine
MAINTAINER Solstech

ENV PYTHONUNBUFFERED 1

RUN pip install pipenv
RUN pipenv install
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
