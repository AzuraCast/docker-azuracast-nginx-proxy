FROM nginxproxy/nginx-proxy:alpine

# Update Alpine libraries
RUN apk upgrade --no-cache

# Copy configuration files
COPY ./app /app
COPY ./etc/nginx /etc/nginx

RUN chmod a+x /app/custom-entrypoint.sh

# Set default environment variables
ENV DEFAULT_HOST="azuracast.local" \
    NGINX_TIMEOUT=1800

ENTRYPOINT ["/app/custom-entrypoint.sh"]
CMD ["forego", "start", "-r"]
