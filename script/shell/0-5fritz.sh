echo '
zone "marley.it23.com" {
	type master;
	file "/etc/bind/it23/marley.it23.com";
};' > /etc/bind/named.conf.local

echo '
zone "eldia.it23.com" {
	type master;
	file "/etc/bind/it23/eldia.it23.com";
};' > /etc/bind/named.conf.local

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