#!/bin/sh

############################################################
# Domain settings

jsonOption() {
  key="$1"
  cat $CONFIG_FILE | jq -r ".$key"
}

value() {
  env | egrep "^$1=" | cut -d= -f2
}

env_print() {
  echo $1: $(value $1) > /dev/stderr
}

env_print_secret() {
  if [ -z "$(value $1)" ]; then
    echo $1: > /dev/stderr
  else
    echo $1: 'xxxxxxxxxx' > /dev/stderr
  fi
}

DOMAIN=`jsonOption domain`
EMAIL=letsencrypt@${DOMAIN}
############################################################

############################################################
# GoDaddy API Credentials
GODADDY_API_KEY=`jsonOption apiKey`
GODADDY_API_SECRET=`jsonOption apiSecret`
GODADDY_URL=`jsonOption apiUrl`
############################################################

env_print CONFIG_FILE
env_print DOMAIN
env_print GODADDY_API_KEY
env_print_secret GODADDY_API_SECRET
env_print GODADDY_URL