FROM node:13.12-alpine

RUN apk add git npm

RUN npm install -g bower
RUN git clone https://github.com/Kurento/kurento-tutorial-node.git &&\
    cd kurento-tutorial-node/kurento-magic-mirror &&\
    git checkout master &&\
    npm install &&\
    cd static &&\
    bower install --allow-root &&\
    cd ..

EXPOSE 8443

WORKDIR /kurento-tutorial-node/kurento-magic-mirror
ENTRYPOINT ["npm", "start"]
