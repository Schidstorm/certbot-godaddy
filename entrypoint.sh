#!/bin/sh

$command="$1"

if [ "$command" == "request" ]; then
  certbot-godaddy-request.sh
elif [ "$command" == "renew" ]; then
  certbot-godaddy-renew.sh
else
  cat << _EOF
usage: $0 request|renew
_EOF
exit 1
fi