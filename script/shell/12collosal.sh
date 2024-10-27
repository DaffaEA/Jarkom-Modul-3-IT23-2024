echo 'upstream round_robin {
    server 10.75.2.2;
    server 10.75.2.3;
    server 10.75.2.4;
}

upstream least_conn {
    least_conn;
    server 10.75.2.2;
    server 10.75.2.3;
    server 10.75.2.4;
}

upstream ip_hash {
    ip_hash;
    server 10.75.2.2;
    server 10.75.2.3;
    server 10.75.2.4;
}

upstream generic_hash {
    hash $request_uri;
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
            proxy_pass http://round_robin;
            auth_basic "Restricted Content";
	        auth_basic_user_file /etc/nginx/supersecret/htpasswd;
                allow 10.75.1.77;
                allow 10.75.1.88;
                allow 10.75.2.144;
                allow 10.75.2.156;
            deny all;
        }

        location /titan {
            proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki;
            proxy_set_header Host attackontitan.fandom.com;

            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

    location /round_robin/ {
        proxy_pass http://round_robin;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /least_conn/ {
        proxy_pass http://least_conn;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /ip_hash/ {
        proxy_pass http://ip_hash;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /generic_hash/ {
        proxy_pass http://generic_hash;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_nginx

service nginx restart