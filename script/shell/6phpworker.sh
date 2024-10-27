service nginx start
service php7.3-fpm start

mkdir -p /var/www/eldia.it23.com

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1TvebIeMQjRjFURKVtA32lO9aL7U2msd6' -O /root/eldia.zip
unzip -o /root/eldia.zip -d /var/www/eldia.it23.com

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/eldia.it23.com
ln -s /etc/nginx/sites-available/eldia.it23.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
    listen 80;
    server_name eldia.it23.com;

    root /var/www/eldia.it23.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock; 
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/sites-available/eldia.it23.com

service nginx restart