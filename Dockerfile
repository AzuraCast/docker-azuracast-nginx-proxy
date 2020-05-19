FROM jwilder/nginx-proxy:alpine

# Copy configuration files
COPY ./nginx.tmpl /app/nginx.tmpl
COPY ./docker-entrypoint.sh /app/docker-entrypoint.sh
COPY ./azuracast.conf /etc/nginx/azuracast.conf

RUN chmod a+x /app/docker-entrypoint.sh

# Set default environment variables
ENV DEFAULT_HOST="azuracast.local"