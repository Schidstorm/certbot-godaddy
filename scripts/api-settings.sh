#!/bin/sh

############################################################
# Domain settings

option() {
  key="$1"
  cat $CONFIG_FILE | jq -r ".$key"
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