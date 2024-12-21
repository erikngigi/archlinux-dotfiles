#!/usr/bin/env bash

echo "Shell Script that installs the prerequisite packages needed for Magento2 and Akeneo on Ubuntu."
sleep 5

# Add required repositories
echo "Adding Ondrej PHP to Ubuntu's default package repositories"
add-apt-repository ppa:ondrej/php
sleep 5

echo "Adding Elasticsearch to Ubuntu's default package repositories"
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sleep 5

# Update system packages
apt update
apt upgrade -y
sleep 5

# Packages the system needs
echo "Packages needed by the system"
apt install wget curl nano software-properties-common dirmngr apt-transport-https gnupg2 ca-certificates lsb-release ubuntu-keyring zip net-tools unzip mysql-server mycli elasticsearch libapache2-mod-php8.1 php8.1 php8.1-gmp php8.1-xmlrpc php8.1-common php8.1-cli php8.1-apcu php8.1-bcmath php8.1-curl php8.1-opcache php8.1-fpm php8.1-gd php8.1-intl php8.1-mysql php8.1-xml php8.1-zip php8.1-mbstring php8.1-imagick php8.1-tidy php8.1-soap php8.1-xsl libsodium-dev libsodium23 libssl-dev libcurl4-openssl-dev redis-server -y
sleep 5

# Install composer
echo "Download composer"
curl -sS https://getcomposer.org/installer -o composer-setup.php

echo "Install composer"
php composer-setup.php

echo "Move the composer binary"
mv composer.phar /usr/local/bin/composer

echo "Verify composer installation"
composer --version
sleep 5

# Enable ufw ports
echo "Allowed ports for the firewall"
ufw allow 22
ufw allow 80/tcp
# ufw allow 81/tcp
ufw allow 443/tcp
# ufw allow 444/tcp
ufw enable
ufw reload
sleep 5

# Limit elasticsearch memory
file_path="/etc/elasticsearch/jvm.options.d/memory.options"

echo "Adding elasticsearch memory configuration options to $file_path"
cat >$file_path <<EOL
-Xms1g
-Xmx1g
EOL

# Start and enable the service
systemctl enable elasticsearch --now

# Check if elastisearch is working
curl http://localhost:9200
sleep 5

# Install certbot for ssl certificates
echo "Installing certbot for ssl certificates"
snap install core
snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
#certbot certonly --nginx --agree-tos --no-eff-email --staple-ocsp --preferred-challenges http -m name@example.com -d magento.development.tsrv.dev
#certbot certonly --nginx --agree-tos --no-eff-email --staple-ocsp --preferred-challenges http -m name@example.com -d akeneo.development.tsrv.dev
#openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096
#systemctl list-timers
sleep 5

# Install yarn
echo "Install yarn"
npm install -g yarn

# Create directories for test servers
#mkdir -p /var/www/{website1,website2}

#chown -R "$USER:$USER" /var/www/website1
#chown -R "$USER:$USER" /var/www/website2
# chmod -R 755 /var/www

# Configure PHP-FPM
# sed -i 's/user = www-data/user = nginx/' /etc/php/8.1/fpm/pool.d/www.conf
# sed -i 's/group = www-data/group = nginx/' /etc/php/8.1/fpm/pool.d/www.conf
# sed -i 's/listen.owner = www-data/listen.owner = nginx/' /etc/php/8.1/fpm/pool.d/www.conf
# sed -i 's/listen.owner = www-data/listen.owner = nginx/' /etc/php/8.1/fpm/pool.d/www.conf
sed -i 's/max_execution_time = 30/max_execution_time = 180/' /etc/php/8.1/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 180/' /etc/php/8.1/cli/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php/8.1/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 25M/g' /etc/php/8.1/fpm/php.ini
sed -i 's/post_max_size = 8M/post_max_size = 25M/g' /etc/php/8.1/fpm/php.ini
sed -i 's/zlib.output_compression = Off/zlib.output_compression = On/g' /etc/php/8.1/fpm/php.ini

# systemctl restart php8.1-fpm

# chgrp -R nginx /var/lib/php/sessions
