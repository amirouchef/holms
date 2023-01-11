#!/bin/bash

# read -p Enter your target domain name :  " domainNameTarget

#output_whois=$(whois $1)

output_nslookup=$(nslookup $1 | tail -n 2)

echo "$output_nslookup"

output_whois=$(whois $1 | sed -n '/domain/,/>>>/ {/%%/b; /domain/b; />>>/b; /key/b; /holder/b; /anonymous/b; /obsoleted/b; /eppstatus/b; /eppstatus/b; /eligstatus/b; /reachstatus/b; p}')

echo  "$output_whois"

output_tracert=$(traceroute -m 3 $1)

echo "$output_tracert"

output_dig=$(dig @1.1.1.1 $1 NS | sed -n '/ANSWER SECTION/,/Query time/ {/ANSWER SECTION/b; /Query time/b; p}')

echo "$output_dig"

output_dnsrecon=$(dnsrecon -d $1)

echo "$output_dnsrecon"

output_whatweb=$(whatweb $1)

echo "$output_whatweb"

output_wafw00f=$(wafw00f $1 | sed -n '/*/, /~/ {/*/b; /~/b; p}')

echo "$output_wafw00f"
