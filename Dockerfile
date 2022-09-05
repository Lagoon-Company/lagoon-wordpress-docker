FROM wordpress:php8.1
COPY custom.ini $PHP_INI_DIR/conf.d/
