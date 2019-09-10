FROM jwilder/nginx-proxy:alpine

# Generate the dhparam.pem file (takes a long time)
RUN openssl dhparam -dsaparam -out /etc/nginx/dhparam/dhparam.pem 4096

# SSL self-signed cert generation
RUN openssl req -new -nodes -x509 -subj "/C=US/ST=Texas/L=Austin/O=IT/CN=localhost" \
    -days 365 -extensions v3_ca \
    -keyout /etc/nginx/certs/default.key \
	-out /etc/nginx/certs/default.crt

# Copy configuration file
COPY ./conf.d/azuracast.conf /etc/nginx/conf.d/azuracast.conf

# Set default environment variables
ENV DEFAULT_HOST="azuracast.local"