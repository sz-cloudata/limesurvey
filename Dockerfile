
FROM tutum/lamp

RUN apt-get install -q -y curl php5-gd php5-ldap php5-imap; apt-get clean ; \
	php5enmod imap

RUN rm -rf /app; \
	mkdir -p /app; \
	curl -L -o /app/limesurvey.tar.bz2  https://www.limesurvey.org/en/stable-release/finish/25-latest-stable-release/1142-limesurvey205plus-build140730-tar-bz2 ; \
	tar --strip-components=1 -C /app -xvjf /app/limesurvey.tar.bz2 ; \
	rm  /app/limesurvey.tar.bz2 ; \
	chown -R www-data:www-data /app

RUN chown www-data:www-data /var/lib/php5


EXPOSE 80 3306
CMD ["/run.sh"]
