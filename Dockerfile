FROM nginx:1.25-alpine

COPY start.sh /usr/local/bin/

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh

EXPOSE 8080

CMD ["start.sh"]
