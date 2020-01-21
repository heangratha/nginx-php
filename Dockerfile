FROM debian:buster-slim

ENV TZ=Asia/Phnom_Penh
ENV PHP_VERSION=7.4
RUN apt-get -qq update && \
    apt-get -yqq install apt-transport-https lsb-release ca-certificates wget && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get -qq update && apt-get -qqy upgrade && apt-get -q autoclean && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
            DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            nginx \
            locales \
            curl \
            bzip2 \
            openssl \
            less \
            php-apcu \
            php$PHP_VERSION-fpm \
            php$PHP_VERSION-bcmath php$PHP_VERSION-bz2 php$PHP_VERSION-cli php$PHP_VERSION-common php$PHP_VERSION-curl \
            php$PHP_VERSION-gd php$PHP_VERSION-imap php$PHP_VERSION-interbase php$PHP_VERSION-intl php$PHP_VERSION-json \
            php$PHP_VERSION-mbstring php$PHP_VERSION-mysql php$PHP_VERSION-opcache php$PHP_VERSION-readline php$PHP_VERSION-soap \
            php$PHP_VERSION-xml php$PHP_VERSION-xmlrpc php$PHP_VERSION-xsl php$PHP_VERSION-zip

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ADD docker/nginx.conf /etc/nginx/nginx.conf

ADD docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]
