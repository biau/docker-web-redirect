FROM nginx:1.15-alpine

COPY start.sh /usr/local/bin/

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh \
	&& chgrp -R 0 /var/cache/nginx/ \
	&& chmod -R g+rw /var/cache/nginx/ \
	&& chgrp -R 0 /var/run/ \
	&& chmod -R g+rw /var/run/	
	
EXPOSE 8080

CMD ["start.sh"]
