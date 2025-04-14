#!/bin/bash
echo; echo "Check for and install dependencies."
curl -V &>/dev/null && dig -v &>/dev/null || (sudo apt update; sudo apt install -y curl host)
echo; echo "Write the updater script>"
sudo tee /root/.ddns.sh >/dev/null <<'EOF'
#!/bin/bash
###
domain=your_domain_here
token=your_token_here
###
day0=
old4=
old6=
new4=$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com 2>/dev/null | tr -d '"')
new6=$(dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com 2>/dev/null | tr -d '"')
[[ -z $new4 ]] && [[ -z $new6 ]] && exit 1
[[ -z $new4 ]] && new4=$old4
[[ -z $new6 ]] && new6=$old6
[[ $new4 == $old4 ]] && [[ $new6 == $old6 ]] && [[ $(date +%s) -lt $(( $day0 + 86400 )) ]] && exit 0
curl -k "https://www.duckdns.org/update?domains=$domain&token=$token&ip=$new4&ipv6=$new6" &>/dev/null || exit 1
sed -i "s/^old4.*/old4=$new4/;s/^old6.*/old6=$new6/;s/^day0.*/day0=$(date +%s)/" $0
exit 0
EOF
echo; read -p "Enter or paste your duckdns domain here: " duckd
echo; read -p "Enter or paste your duckdns token here: " duckt
sudo sed -i "s/your_domain_here/$duckd/;s/your_token_here/$duckt/" /root/.ddns.sh
sudo chmod +x /root/.ddns.sh
echo; echo "Add job to cron."
sudo crontab -l 2>/dev/null | grep -q '.ddns.sh' || (sudo crontab -l 2>/dev/null; echo "*/15 * * * * /root/.ddns.sh &>/dev/null") | sudo crontab -
sudo service cron restart
echo; read -n 1 -s -r -p "DuckDNS updater script is installed. Press any key to update IP addresses and exit."
sudo bash /root/.ddns.sh
exit 0
