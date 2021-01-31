#!/bin/sh

command="$1"
export CONFIG_FILE=${CONFIG_FILE:-"$2"}

if [ "$command" == "request" ]; then
  certbot-godaddy-request.sh
elif [ "$command" == "renew" ]; then
  certbot-godaddy-renew.sh
else
  cat << _EOF
usage: $0 request|renew [config-file.json]
_EOF
exit 1
fi