# DuckDNS-Updater

## Usage

The "setup.sh" script automatically checks for and installs dependencies if they are missing.  It then sets up a cron job to run the updater script every 15 minutes, and it generates the update script to check and send both IP v4 and v6 addresses to DuckDNS.  The updater script uses "dig" to discover both IP v4 and v6 addresses from Google servers. If either address has changed, or 7 days have passed since the last update, it uses "curl" to update the IP addresses stored on DuckDNS's servers.

```shell
wget https://github.com/ctonton/DuckDNS-Updater/raw/main/setup.sh -O setup.sh; chmod +x setup.sh; bash setup.sh
```
