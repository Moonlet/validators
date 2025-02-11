# Base stage
FROM ubuntu:22.04 AS base

# Dependencies stage
FROM base AS deps

# Define build arguments
ARG GIT_REPO
ARG BINARY

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates net-tools && \
    rm -rf /var/lib/apt/lists/*

# Builder stage
FROM deps AS builder

# Use build arguments
ARG GIT_REPO
ARG BINARY

RUN wget ${GIT_REPO} -O /${BINARY} && \
    chmod +x /${BINARY}

# Runner stage
FROM base AS runner

# Define environment variables
ARG BINARY

COPY --from=builder /${BINARY} /${BINARY}
COPY entrypoint.sh /entrypoint.sh

COPY config/_app.toml /app.toml
COPY config/_client.toml /client.toml
COPY config/_config.toml /config.toml

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
