# Docker nginx image
FROM nginx:1.29.3

# Maintainer details
LABEL Maintainer="Eric Ngigi <cloud@ericngigi.com>"
LABEL Description="Custom Nginx container for for Magento 2.4.7"
LABEL Version="1.0"

# Install system dependencies, clean apt cache after installation
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential vim curl bash \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove default Nginx config and copy Magento-specific ones
RUN rm /etc/nginx/conf.d/default.conf

# Copy global nginx configuration for performance and stability
COPY ./magento.conf /etc/nginx/conf.d/
COPY ./nginx.conf /etc/nginx/nginx.conf

# Create web root directory
RUN mkdir -p /var/www/html && chown -R nginx:nginx /var/www/html

# Change working directory
WORKDIR /var/www/html

# Expose nginx port and run nginx
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
