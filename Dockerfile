# Base stage
FROM ubuntu:22.04 AS base

# Dependencies stage
FROM base AS deps

# Define build arguments
ARG GIT_REPO
ARG BINARY

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates

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

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
