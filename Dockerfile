FROM node


LABEL maintainer = Yannis AMOUZOU <yannis@wiin.io>


RUN apt update && useradd bit && npm install bit-bin --global && chown node.node -R /home/node 

WORKDIR /home/node/vue

COPY package*.json  ./

RUN npm install

COPY . .

RUN chown node.node -R /home/node

USER node

RUN bit init && bit add components --main index.ts --id vue

CMD [ "/bin/bash" ]