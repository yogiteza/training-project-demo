FROM asia.gcr.io/sirclo-iii-nonprod/swift-pwa:2.6.8-1681327884
ARG GIT_URL="git@github.com:icube-mage/swift-oriflame.git"

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app
RUN git clone ${GIT_URL} src

COPY pages/* pages/
COPY public/* public/
COPY project_patch.sh project_patch.sh
COPY swift.config.js swift.config.js
COPY .env .env

# Patch pwa
RUN sh project_patch.sh

# build pwa
RUN yarn build; 

EXPOSE 3000
