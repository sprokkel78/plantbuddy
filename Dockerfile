# Use official PHP + Apache image
FROM php:8.2-apache

# Enable Apache rewrite module (optional if you use .htaccess)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy project files into container
COPY . /var/www/html/

# Create required directories and ensure they are writable
# (In the repo these directories exist but may contain .gitkeep)
RUN mkdir -p /var/www/html/water \
    && mkdir -p /var/www/html/nutrients \
    && mkdir -p /var/www/html/plants \
    && chown -R www-data:www-data /var/www/html/water /var/www/html/nutrients /var/www/html/plants \
    && chmod -R 775 /var/www/html/water /var/www/html/nutrients /var/www/html/plants

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
