FROM node:18
# alternatively you can use FROM strapi/base:latest

ARG DATABASE_HOST
ENV DATABASE_HOST=${DATABASE_HOST}
ARG DATABASE_PORT
ENV DATABASE_PORT=${DATABASE_PORT}
ARG DATABASE_NAME
ENV DATABASE_NAME=${DATABASE_NAME}
ARG DATABASE_USERNAME
ENV DATABASE_USERNAME=${DATABASE_USERNAME}
ARG DATABASE_PASSWORD
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}

# Set up working directory
WORKDIR /app

RUN apt-get update && apt-get install -y git
RUN ["git", "clone", "https://github.com/dyllisLev/strapi4.git"]

WORKDIR /app/strapi4

# Install dependencies, but not generate a yarn.lock file and fail if an update is needed
RUN yarn install --frozen-lockfile

COPY .env .
# Build admin panel
RUN yarn build

# Run on port 1337
EXPOSE 1337

# Start strapi server
# CMD ["yarn", "start"]
# CMD git fetch origin && git reset --hard origin/main
CMD ["yarn", "develop"]