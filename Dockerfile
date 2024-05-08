FROM nginx:1.25-alpine

COPY start.sh /usr/local/bin/

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh \
	&& chgrp -R 0 /var/cache/nginx/ \
	&& chmod -R g+rw /var/cache/nginx/ \
	&& chgrp -R 0 /var/run/ \
	&& chmod -R g+rw /var/run/ \
 	&& chgrp -R 0 /etc/nginx/conf.d/default.conf \
	&& chmod -R g+rw /etc/nginx/conf.d/default.conf
 
EXPOSE 8080

CMD ["start.sh"]
