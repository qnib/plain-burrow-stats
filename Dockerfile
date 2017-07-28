FROM qnib/alplain-node

ARG BS_VER=0.6.2
ARG BS_URL=https://github.com/tulios/burrow-stats/archive
ARG NODE_ENV=production

WORKDIR /opt/burrow-stats
RUN mkdir -p /opt/burrow-stats \
 && wget -qO- ${BS_URL}/${BS_VER}.tar.gz | tar xfz - -C /tmp/ \
 && mv /tmp/burrow-stats-${BS_VER}/package.json . \
 && mv /tmp/burrow-stats-${BS_VER}/* . \
 && mv /tmp/burrow-stats-${BS_VER}/.babelrc .
RUN npm install -g yarn
RUN yarn

ENV BURROW_CLUSTER_NAME=local \
    BURROW_HOST=burrow \
    BURROW_CONSUMER_NAME=consumer \
    BURROW_TOPIC_NAME=topic \
    BURROW_POLL_INTERVAL=30

