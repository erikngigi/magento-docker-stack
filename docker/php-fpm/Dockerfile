# Base image
FROM php:8.3-fpm

# Maintainer details
LABEL Maintainer="Eric Ngigi <cloud@ericngigi.com>"
LABEL Description="PHP-FPM using version 8.3 for Magento 2.4.7"
LABEL Version="1.0"

# Install system dependencies, clean apt cache after installation
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpng-dev libjpeg62-turbo-dev libfreetype6-dev locales zip jpegoptim optipng pngquant gifsicle vim unzip git curl \
    libonig-dev libzip-dev libgd-dev libssl-dev libxml2-dev libreadline-dev libxslt-dev supervisor bash mycli zsh gnupg2 libmagickwand-dev \
    libmagickcore-dev less && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install and enable third-party PHP extensions via PECL
RUN pecl install imagick apcu && \
    docker-php-ext-enable imagick apcu

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install \
    bcmath \
    calendar \
    exif \
    gd \
    gettext \
    intl \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    soap \
    sockets \
    xsl \
    xml \
    zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add Composer to the PATH
ENV PATH="/usr/local/bin:$PATH"

# Create application user
RUN groupadd -g 1000 magento && \
    useradd -u 1000 -ms /bin/bash -g magento magento && \
    mkdir -p /home/magento/.config && \
    chown -R magento:magento /var/www/html /home/magento

# Copy zsh configuration
COPY ./templates/zsh /home/magento/.config/zsh
COPY ./templates/.zshrc /home/magento/.zshrc

# Adjust ownership
RUN chown -R magento:magento /home/magento/.config /home/magento/.zshrc

# Switch to non-root user
USER magento

# Install Zap (zsh plugin manager)
RUN zsh -c 'zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep'

# Set default shell to Zsh
SHELL [ "/usr/bin/zsh", "-c" ]

# Copy entrypoint script
COPY ./templates/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /var/www/html

# Expose port 9000 and start php-fpm
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 9000
CMD ["php-fpm"]
