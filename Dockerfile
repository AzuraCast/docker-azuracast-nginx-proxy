FROM jwilder/nginx-proxy:alpine

# Copy configuration files
COPY ./nginx.tmpl /app/nginx.tmpl
COPY ./docker-entrypoint.sh /app/docker-entrypoint.sh
COPY ./azuracast.conf /etc/nginx/azuracast.conf

# Set default environment variables
ENV DEFAULT_HOST="azuracast.local"