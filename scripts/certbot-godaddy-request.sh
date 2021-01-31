#!/bin/sh

SCRIPTDIR=$(dirname $(readlink -f $0))
source $SCRIPTDIR/api-settings.sh

certbot certonly \
        --non-interactive \
        --agree-tos \
        --manual-public-ip-logging-ok \
        -m "$EMAIL" \
        --preferred-challenges dns \
        --manual \
        --manual-auth-hook $SCRIPTDIR/certbot-godaddy-auth.sh \
        --manual-cleanup-hook $SCRIPTDIR/certbot-godaddy-cleanup.sh \
        -d *.${DOMAIN} \
        -d ${DOMAIN}