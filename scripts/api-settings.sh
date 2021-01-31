#!/bin/sh

############################################################
# Domain settings

jsonOption() {
  key="$1"
  cat $CONFIG_FILE | jq -r ".$key"
}

env_print() {
  echo $1: $2 > /dev/stderr
}

env_print_secret() {
  if [ -z "$2" ]; then
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

env_print CONFIG_FILE $CONFIG_FILE
env_print DOMAIN $DOMAIN
env_print GODADDY_API_KEY $GODADDY_API_KEY
env_print_secret GODADDY_API_SECRET $GODADDY_API_SECRET
env_print GODADDY_URL $GODADDY_URL