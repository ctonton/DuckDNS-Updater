# DuckDNS-Updater

## Usage

The "setup.sh" script automaticaly checks for and installs dependencies if they are missing.  It then sets up a cron jop to run the updater script every 15 minutes and it generates the update script to check and send both ipv4 and ipv6 addresses to DuckDNS.  The updater script uses "dig" to discover both ip v4 and v6 addresses from Google servers. If either address has changed, or every 7 days, it uses "curl" to update the ip addresses stored on DuckDNS's servers.

```shell
wget https://github.com/ctonton/DuckDNS-Updater/raw/main/setup.sh -O setup.sh; chmod +x setup.sh; bash setup.sh
```
