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
