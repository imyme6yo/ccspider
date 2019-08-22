# @AUTHOR: jon "imyme6yo@gmail.com"
# @DRAFT: 20190822
# @DESCRIPTION: Dockerfile for ccspider project
ARG VERSION=3.7.2

FROM python:${VERSION}-alpine3.7

LABEL maintainer "imyme6yo@gmail.com"

ARG DIRNAME=project_code
ARG PACKAGES=requirements.txt

RUN apk update && apk update
RUN apk add --no-cache --virtual .build-deps openssl-dev libffi-dev g++ gcc libxslt-dev
RUN python -m pip install pip --upgrade

RUN mkdir ${DIRNAME}
ADD . ${DIRNAME}
WORKDIR ${DIRNAME}

RUN pip install -r $PACKAGES

#MAKING CONTAINER 
# # docker build -t $(echo "${PWD##*/}"):dev --build-arg DIRNAME=$(echo "${PWD##*/}") .
#RUNNING CONTAINER
# # docker run --rm -it -v $(pwd)/:/$(echo "${PWD##*/}") $(echo "${PWD##*/}"):dev ash
