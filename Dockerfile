FROM certbot/certbot

RUN apk update && apk upgrade

COPY scripts/api-settings.sh /usr/bin/
COPY scripts/certbot-godaddy-auth.sh /usr/bin/
COPY scripts/certbot-godaddy-cleanup.sh /usr/bin/
COPY scripts/certbot-godaddy-renew.sh /usr/bin/
COPY scripts/certbot-godaddy-request.sh /usr/bin/
COPY scripts/certbot-renew-post-hook.sh /usr/bin/
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/api-settings.sh
RUN chmod +x /usr/bin/certbot-godaddy-auth.sh 
RUN chmod +x /usr/bin/certbot-godaddy-cleanup.sh
RUN chmod +x /usr/bin/certbot-godaddy-renew.sh
RUN chmod +x /usr/bin/certbot-godaddy-request.sh
RUN chmod +x /usr/bin/certbot-renew-post-hook.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]