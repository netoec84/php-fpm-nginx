#!/bin/bash

#curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

curl -O "https://getcomposer.org/download/1.10.17/composer.phar"
chmod a+x composer.phar
sudo mv composer.phar /usr/local/bin/composer

composer global require hirak/prestissimo --prefer-dist --no-interaction \
    && rm -rf /root/.composer/cache/*
