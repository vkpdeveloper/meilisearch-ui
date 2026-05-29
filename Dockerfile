FROM oven/bun:1

# Setting working directory.
WORKDIR /opt/meilisearch-ui

# Copying source files
COPY . .

# Installing dependencies
RUN bun install --frozen-lockfile

EXPOSE 24900

ENV NODE_ENV=prod

RUN ["chmod", "+x", "./scripts/cmd.sh"]
ENTRYPOINT ["./scripts/cmd.sh"]
