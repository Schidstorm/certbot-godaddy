#!/bin/sh

source $(dirname $(readlink -f $0))/api-settings.sh

DNS_REC_TYPE=TXT
DNS_REC_NAME="_acme-challenge"
DNS_REC_DATA="$CERTBOT_VALIDATION"

echo Creating ${DNS_REC_TYPE} record ${DNS_REC_NAME}.${CERTBOT_DOMAIN} for certificate renewal with value ${DNS_REC_DATA}

curl    -i \
        -X PATCH \
        "${GODADDY_URL}/v1/domains/$( echo $CERTBOT_DOMAIN | rev | cut -d. -f1-2 | rev)/records" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: sso-key ${GODADDY_API_KEY}:${GODADDY_API_SECRET}" \
        -d "[{\"data\": \"${DNS_REC_DATA}\", \"name\": \"${DNS_REC_NAME}\", \"type\": \"${DNS_REC_TYPE}\", \"ttl\": 600}]"

sleep 30s
