FROM bitnami/laravel

WORKDIR /var/www/html

COPY . .

RUN composer install
RUN php artisan key:generate

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
