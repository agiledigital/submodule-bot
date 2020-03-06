# TODO: Can we use 13-slim instead?
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm ci --only=production

# Bundle app source
COPY . .

# GPG commit signing key environment variable.
ENV SUBMODULE_BOT_PRIVATE_KEY_ID=$SUBMODULE_BOT_PRIVATE_KEY_ID
ENV SUBMODULE_BOT_PRIVATE_KEY=$SUBMODULE_BOT_PRIVATE_KEY
ENV BITBUCKET_USERNAME=$BITBUCKET_USERNAME
ENV BITBUCKET_PASSWORD=$BITBUCKET_PASSWORD

EXPOSE 3000
CMD [ "node", "server.js" ]