#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-1000}

usermod -u $USER_ID -o www-data && groupmod -g $USER_ID -o www-data

# Start php-fpm
/etc/init.d/php7.3-fpm start
exec "$@"
