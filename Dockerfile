FROM node:18-alpine3.18

ARG APP_DIR=/app

RUN apk add --no-cache python3 \
	make \
	g++ \
	bash

RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}

COPY package.json ${APP_DIR}/
RUN npm install ./

COPY . ${APP_DIR}/

RUN apk update && apk add bash shadow
RUN adduser -D archmage -h /home/archmage -s /usr/bin/bash

COPY ./files/archmagesetup.sh /opt/archmagesetup.sh
RUN chmod +x /opt/archmagesetup.sh && /opt/archmagesetup.sh && rm /opt/archmagesetup.sh

RUN ln -s /dev/null /home/archmage/.bash_history

COPY ./files/list.txt /usr/home/level-4/list.txt
RUN cat ${APP_DIR}/files/.bashrc >> /home/archmage/.bashrc
RUN rm -rf ${APP_DIR}/files

USER archmage

ENTRYPOINT ["npm","start"]
