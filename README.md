# DuckDNS-Updater

## Usage

Creates a bash script to update DuckDNS ipv4 and ipv6 addresses.  Sets up a cron jop to call the script ever 15 minutes.  Uses "dig" to discover both ip v4 and v6 addresses using Google servers.  Uses "cron" to update the DuckDNS service only if either address has changed or after 7 days.

```shell
wget https://github.com/ctonton/DuckDNS-Updater/raw/main/setup.sh -O setup.sh; chmod +x setup.sh; bash setup.sh
```
