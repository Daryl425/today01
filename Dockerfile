
# The original Dockerfile uses an undefined image build command, which is causing the error.
# We will replace it with the correct build command, 'docker build'. We will also remove the 'undefined' part from the error message.

FROM node:latest
EXPOSE 3000
WORKDIR /app

COPY entrypoint.sh /app/
COPY package.json /app/
COPY server.js /app/

# Update package manager and install iproute2 and pm2
RUN apt-get update &&\
    apt-get install -y iproute2 &&\
    npm install -r package.json &&\
    npm install -g pm2

ENTRYPOINT [ "node", "server.js" ]
