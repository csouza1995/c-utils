docker run --rm \
    -v $(pwd):/opt \
    -w /opt laravelsail/php81-composer:latest \
    bash -c "composer create-project laravel/laravel:^10.0 && cd laravel && composer require --dev laravel/sail && composer install && php artisan sail:install --with=pgsql,soketi,redis && ./vendor/bin/sail up -d"
