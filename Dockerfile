FROM alpine:latest AS base

WORKDIR /code

RUN apk upgrade && apk add \
  nginx \
        php81 \
        php81-bcmath \
        php81-cli \
        php81-ctype \
        php81-curl \
        php81-dev \
        php81-dom \
        php81-exif \
        php81-fileinfo \
        php81-fpm \
        php81-gd \
        php81-gettext \
        php81-iconv \
        php81-intl \
        php81-json \
        php81-mbstring \
        php81-mysqli \
        php81-opcache \
        php81-openssl \
        php81-pdo \
        php81-pdo_mysql \
        php81-pdo_pgsql \
        php81-pdo_sqlite \
        php81-pear \
        php81-pecl-memcached \
        php81-phar \
        php81-posix \
        php81-redis \
        php81-session \
        php81-simplexml \
        php81-soap \
        php81-sockets \
        php81-sqlite3 \
        php81-tokenizer \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-zip \
        php81-zlib \
        php81-sodium \
        git \
        runit

COPY rootfs/etc/nginx/http.d /etc/nginx/http.d

COPY rootfs/etc/service /etc/service
COPY rootfs/boot.sh /boot.sh

CMD ["/boot.sh"]

FROM base AS develop

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

FROM develop AS app

COPY code /code

RUN composer install
