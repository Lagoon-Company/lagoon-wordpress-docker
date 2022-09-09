FROM wordpress:php8.1

# php config
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY custom.ini $PHP_INI_DIR/conf.d/

# apache extensions
RUN cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/

# php extensions
RUN apt update && apt upgrade -y \
&& pecl install redis \
&& docker-php-ext-enable redis \
&& docker-php-ext-install pdo pdo_mysql \
&& rm -r /tmp/pear \
&& apt auto-remove && rm -rf /var/lib/apt/lists/*;
