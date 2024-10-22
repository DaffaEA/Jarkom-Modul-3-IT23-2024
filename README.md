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
