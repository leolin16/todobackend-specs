FROM ubuntu
LABEL Author="Leo Lin <leolin@leolin.studio>"

# Prevent dpkg errors
ENV TERM=xterm-256color

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT npm test