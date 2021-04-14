FROM jwilder/nginx-proxy:alpine

# Update Alpine libraries
RUN apk upgrade --no-cache

# Copy configuration files
COPY ./app /app
COPY ./etc/nginx /etc/nginx

RUN chmod a+x /app/docker-entrypoint.sh

# Set default environment variables
ENV DEFAULT_HOST="azuracast.local" \
    NGINX_TIMEOUT=1800