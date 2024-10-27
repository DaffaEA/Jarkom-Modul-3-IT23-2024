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