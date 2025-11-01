# Docker nginx image
FROM nginx:1.29.3

# Maintainer details
LABEL Maintainer="Eric Ngigi <cloud@ericngigi.com>"
LABEL Description="Custom Nginx container for for Magento 2.4.7"
LABEL Version="1.0"

# Remove default Nginx config and copy Magento-specific ones
RUN rm /etc/nginx/conf.d/default.conf

# Change working directory
WORKDIR /etc/nginx

# Expose nginx port and run nginx
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
