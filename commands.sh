#!/bin/bash

#touch /var/log/squid/access.log
#echo $@ 
touch /var/log/squid/access.log
chown proxy: /var/log/squid/access.log
touch /var/log/squid/success.log
chown proxy: /var/log/squid/success.log
$@ &
#$(which tail) -f /var/log/squid/access.log | grep -v 'transaction-end-before-headers'
$(which tail) -f /var/log/squid/access.log
#$(which tail) -f /var/log/squid/success.log
