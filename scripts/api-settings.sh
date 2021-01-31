#!/bin/sh

############################################################
# Domain settings

option() {
  key="$1"
  cat $CONFIG_FILE | jq -r ".$key"
}

env_print() {
  echo $1: $$1 > /dev/stderr
}

env_print_secret() {
  if [ -z $$1 ]; then
    echo $1: > /dev/stderr
  else
    echo $1: 'xxxxxxxxxx' > /dev/stderr
  fi
}

DOMAIN=$(option domain)
EMAIL=letsencrypt@${DOMAIN}
############################################################

############################################################
# GoDaddy API Credentials
GODADDY_API_KEY=$(option apiKey)
GODADDY_API_SECRET=$(option apiSecret)
GODADDY_URL=$(option apiUrl)
############################################################

env_print DOMAIN
env_print GODADDY_API_KEY
env_print_secret GODADDY_API_SECRET
env_print GODADDY_URL