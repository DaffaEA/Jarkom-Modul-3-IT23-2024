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