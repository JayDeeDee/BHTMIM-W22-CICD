# **********************************************************************************
# defines how the docker image will be built
# **********************************************************************************
FROM node:10.24.0
LABEL authors="JayDeeDee"
RUN apt-get update && apt-get install -y curl

# create frontend directory and copy everything from the source path
WORKDIR /frontend
COPY . /frontend

# install global and dev dependencies and init fe project
RUN npm install -g npm-check-updates
RUN npm install -g gulp
RUN npm install -g sass
RUN npm install
RUN npm run start

# expose ports for fe and start local dev task
EXPOSE 3001 8080
CMD ["gulp", "DEV_auto"]