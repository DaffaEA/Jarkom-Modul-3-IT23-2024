 echo 'upstream worker {
    server 10.75.2.2;
    server 10.75.2.3;
    server 10.75.2.4;
}

server {
    listen 80;
    server_name eldia.it23.com;

    root /var/www/eldia.it23.com;

    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_nginx

ln -s /etc/nginx/sites-available/lb_nginx /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default

service nginx restart

## Menguji server Nginx dengan beban 6000 permintaan pada 200 request/detik ##
# ab -n 6000 -c 200 http://eldia.it23.com/