FROM ubuntu:18.04

WORKDIR /root

ADD source /root

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y nodejs 
RUN apt-get install -y npm 
RUN npm install 
RUN npm install -g bower 
RUN bower install --allow-root


EXPOSE 8000
ENTRYPOINT ["npm", "start"]
