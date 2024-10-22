# Jarkom-Modul-3-IT22-2024


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

