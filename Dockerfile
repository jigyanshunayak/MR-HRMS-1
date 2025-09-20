FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

##ENV NODE_ENV production
ENV NODE_ENV $NODE_ENV
ENV DEBUG $DEBUG

# Copy app dependencies
#COPY package*.json yarn.lock ./
#
RUN chmod 2777 "/usr/src/app"

COPY . /usr/src/app

# Install app dependencies
RUN yarn install
RUN yarn build

EXPOSE 3030

CMD [ "yarn", "start", "-p", "3030" ]