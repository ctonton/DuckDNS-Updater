# DuckDNS-Updater
Bash script to update DuckDNS ipv4 and ipv6 addresses.
Sets up a cron jop to call the script ever 15 minutes.
Uses "dig" to discover both ip v4 and v6 addresses.
Uses "cron" to update the DuckDNS service only if either 
address has changed or after 7 days.
