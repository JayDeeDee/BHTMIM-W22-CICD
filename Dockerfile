# **********************************************************************************
# defines how the docker image will be built
# **********************************************************************************
FROM node:10-alpine
LABEL authors="JayDeeDee"
# update dependencies and install curl
RUN apk update && apk add curl
# Create frontend directory
WORKDIR /frontend

# This will copy everything from the source path
COPY . /frontend
# update each dependency in package.json to the latest version
RUN npm install -g npm-check-updates
RUN npm install -g gulp
RUN npm install -g sass
RUN npm install
RUN npm run start

# Bundle frontend and source
EXPOSE 3001 8080
CMD ["gulp", "DEV_auto"]