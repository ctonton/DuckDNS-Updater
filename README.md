# DuckDNS-Updater

## Usage

The "setup.sh" script automaticaly checks for and installs dependencies "cron" and "dig".  It then sets up a cron jop to run the updater script every 15 minutes and it generates the update script to check and send both ipv4 and ipv6 addresses to DuckDNS.  The updater script uses "dig" to discover both ip v4 and v6 addresses from Google serversand then uses "cron" to update the ip addresses stored on DuckDNS servers only if either address has changed or after 7 days.

```shell
wget https://github.com/ctonton/DuckDNS-Updater/raw/main/setup.sh -O setup.sh; chmod +x setup.sh; bash setup.sh
```
