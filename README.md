# Jarkom-Modul-3-IT22-2024


| Nama | NRP |
| :--: | :--: |
| Daffa Rajendra Priyatama | 5027231009 |
| Nabiel Nizar Anwari | 5027231087 |

## CONFIGURATION

### Paradis 
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.75.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.75.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.75.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 10.75.4.1
    netmask 255.255.255.0

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.75.0.0/16
```
### Annie (Laravel Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.1.2
    netmask 255.255.255.0
    gateway 10.75.1.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Bertholdt (Laravel Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.1.3
    netmask 255.255.255.0
    gateway 10.75.1.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Reiner (Laravel Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.1.4
    netmask 255.255.255.0
    gateway 10.75.1.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Armin (PHP Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.2.2
    netmask 255.255.255.0
    gateway 10.75.2.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Eren (PHP Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.2.3
    netmask 255.255.255.0
    gateway 10.75.2.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Mikasa (PHP Worker)
```
auto eth0
iface eth0 inet static
    address 10.75.2.4
    netmask 255.255.255.0
    gateway 10.75.2.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Beast (Load Balancer - Laravel)
```
auto eth0
iface eth0 inet static
    address 10.75.3.2
    netmask 255.255.255.0
    gateway 10.75.3.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Colossal (Load Balancer - PHP)
```
auto eth0
iface eth0 inet static
    address 10.75.3.3
    netmask 255.255.255.0
    gateway 10.75.3.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Warhammer (Database Server)
```
auto eth0
iface eth0 inet static
    address 10.75.3.4
    netmask 255.255.255.0
    gateway 10.75.3.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Tybur (DHCP Server)
```
auto eth0
iface eth0 inet static
    address 10.75.4.2
    netmask 255.255.255.0
    gateway 10.75.4.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Fritz (DNS Server)
```
auto eth0
iface eth0 inet static
    address 10.75.4.3
    netmask 255.255.255.0
    gateway 10.75.4.1

up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```
### Erwin (Client)
```
auto eth0
iface eth0 inet dhcp
```
### Zeke (Client)
```
auto eth0
iface eth0 inet dhcp
```

# Soal 1

```
Pulau Paradis telah menjadi tempat yang damai selama 1000 tahun, namun kedamaian tersebut tidak bertahan selamanya. Perang antara kaum Marley dan Eldia telah mencapai puncak. Kaum Marley yang dipimpin oleh Zeke, me-register domain name marley.yyy.com untuk worker Laravel mengarah pada Annie. Namun ternyata tidak hanya kaum Marley saja yang berinisiasi, kaum Eldia ternyata sudah mendaftarkan domain name eldia.yyy.com untuk worker PHP (0) mengarah pada Armin.
```

```
apt-get update -y
apt-get install bind9 -y
```
### script Fritz(DNS server)
```bash
echo '
zone "marley.it23.com" {
	type master;
	file "/etc/bind/it23/marley.it23.com";
};' > /etc/bind/named.conf.local

echo '
zone "eldia.it23.com" {
	type master;
	file "/etc/bind/it23/eldia.it23.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/it23

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     marley.it23.com. root.marley.it23.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      marley.it23.com.
@       IN      A       10.75.1.2
@       IN      AAAA    ::1' > /etc/bind/it23/marley.it23.com

echo "marley.it23.com harusnya bisa(in theory)"

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     eldia.it23.com. root.eldia.it23.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      eldia.it23.com.
@       IN      A       10.75.2.2
@       IN      AAAA    ::1' > /etc/bind/it23/eldia.it23.com

echo "eldia.it23.com harusnya bisa(in theory)"
```

## Soal 2
```
1. Semua Client harus menggunakan konfigurasi ip address dari keluarga Tybur (dhcp).
2. Client yang melalui bangsa marley mendapatkan range IP dari [prefix IP].1.05 - [prefix IP].1.25 dan [prefix IP].1.50 - [prefix IP].1.100 (2)
3. Client yang melalui bangsa eldia mendapatkan range IP dari [prefix IP].2.09 - [prefix IP].2.27 dan [prefix IP].2 .81 - [prefix IP].2.243 (3)
4. Client mendapatkan DNS dari keluarga Fritz dan dapat terhubung dengan internet melalui DNS tersebut (4)
5. Dikarenakan keluarga Tybur tidak menyukai kaum eldia, maka mereka hanya meminjamkan ip address ke kaum eldia selama 6 menit. Namun untuk kaum marley, keluarga Tybur meminjamkan ip address selama 30 menit. Waktu maksimal dialokasikan untuk peminjaman alamat IP selama 87 menit. (5)
```
### Script Fritz(DNS Server)
```
echo '
options {
        directory "/var/cache/bind";

        forwarders {
            192.168.122.1;
        };

        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options
```
### Script Tybur(DHCP Server)
```
apt-get update -y
apt-get install isc-dhcp-server -y
```
```bash
echo '
INTERFACESv4="eth0"
' > /etc/default/isc-dhcp-server

echo 'subnet 10.75.1.0 netmask 255.255.255.0 {
    range 10.75.1.5 10.75.1.25;
    range 10.75.1.50 10.75.1.100;
    option routers 10.75.1.1;
    option broadcast-address 10.75.1.255;
    option domain-name-servers 10.75.4.3;
    default-lease-time 360;
    max-lease-time 5220;
}

subnet 10.75.2.0 netmask 255.255.255.0 {
    range 10.75.2.9 10.75.2.27;
    range 10.75.2.81 10.75.2.243;
    option routers 10.75.2.1;
    option broadcast-address 10.75.2.255;
    option domain-name-servers 10.75.4.3;
    default-lease-time 1800;
    max-lease-time 5220;
}

subnet 10.75.3.0 netmask 255.255.255.0 {
    option routers 10.75.3.1;
}

subnet 10.75.4.0 netmask 255.255.255.0 {
    option routers 10.75.4.1;
}' > /etc/dhcp/dhcpd.conf
```
### Script Paradis (DHCP Relay) 
```
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start
```
```bash
echo '
SERVERS="10.75.4.2"
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=""
' > /etc/default/isc-dhcp-relay
```
Jangan Lupa Uncomment di bagian `/etc/sysctl.conf`
```
net.ipv4.ip_forward=1
```

## Soal 3
```
Armin berinisiasi untuk memerintahkan setiap worker PHP untuk melakukan konfigurasi virtual host untuk website berikut https://intip.in/BangsaEldia dengan menggunakan php 7.3 (6)
```

### script php worker
install.sh
```bash
apt-get update
apt-get install nginx -y
apt-get install wget unzip -y
apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y
```
3.sh
```bash
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
```

## Soal 4

```
Dikarenakan Armin sudah mendapatkan kekuatan titan colossal, maka bantulah kaum eldia menggunakan colossal agar dapat bekerja sama dengan baik. Kemudian lakukan testing dengan 6000 request dan 200 request/second. (7)
```

### script DNS Server 
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     eldia.it23.com. root.eldia.it23.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      eldia.it23.com.
@       IN      A       10.75.3.3
@       IN      AAAA    ::1' > /etc/bind/it23/eldia.it23.com

echo "eldia.it23.com harusnya bisa(in theory)"
```
### script LB
```
apt-get update
apt-get install nginx
```
```bash
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
```

## Soal 5
```
Karena Erwin meminta “laporan kerja Armin”, maka dari itu buatlah analisis hasil testing dengan 1000 request dan 75 request/second untuk masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
Nama Algoritma Load Balancer
1. Report hasil testing pada Apache Benchmark
2. Grafik request per second untuk masing masing algoritma. 
3. Analisis (8)
```
### script LB
```bash
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
        proxy_set_header Host $host;
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

## testing dengan 6000 request dan 200 request/second ##
# ab -n 6000 -c 200 http://eldia.it23.com/

## testing dengan 1000 request dan 75 request/second ##
# ab -n 1000 -c 75 http://eldia.it23.com/round_robin/
# ab -n 1000 -c 75 http://eldia.it23.com/least_conn/
# ab -n 1000 -c 75 http://eldia.it23.com/ip_hash/
# ab -n 1000 -c 75 http://eldia.it23.com/generic_hash/

## testing dengan 1000 request dan 10 request/second ##
# ab -n 1000 -c 10 http://eldia.it23.com/least_conn/
```

## Soal 6
```
Dengan menggunakan algoritma Least-Connection, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 1000 request dengan 10 request/second, kemudian tambahkan grafiknya pada “laporan kerja Armin”. (9)
```

## Soal 7
```
Selanjutnya coba tambahkan keamanan dengan konfigurasi autentikasi di Colossal dengan dengan kombinasi username: “arminannie” dan password: “jrkmyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/supersecret/ (10)
```
### script LB
```bash
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_nginx
mkdir /etc/nginx/supersecret
htpasswd -bc /etc/nginx/supersecret/htpasswd arminannie jrkmit23

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

ln -s /etc/nginx/sites-available/lb_nginx /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```

## Soal 8
```
Lalu buat untuk setiap request yang mengandung /titan akan di proxy passing menuju halaman https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki (11) 
hint: (proxy_pass)
```
### script LB
```bash
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
```

## Soal 9
```
Selanjutnya Colossal ini hanya boleh diakses oleh client dengan IP [Prefix IP].1.77, [Prefix IP].1.88, [Prefix IP].2.144, dan [Prefix IP].2.156. (12) 
hint: (fixed in dulu clientnya)
```

```bash
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
```

## Soal 10
```
Karena mengetahui bahwa ada keturunan marley yang mewarisi kekuatan titan, Zeke pun berinisiatif untuk menyimpan data data penting di Warhammer, dan semua data tersebut harus dapat diakses oleh anak buah kesayangannya, Annie, Reiner, dan Berthold.  (13)
```
