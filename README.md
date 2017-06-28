# letsencrypt-demo
Demo of setting up lets encrypt for nginx


## Let's encrypt with nginx

If you want to work from scratch

<code>
	docker-compose -f docker-compose-nomount.yml up -d
	docker exec -u 0 -it webserver /bin/bash	
</code>

Verify that the website config is there:

<code>
	cat /etc/nginx/sites-enabled/test1.test.boucke.be
</code>

Optional: add a location to serve .well-known in the config and reload (not needed in nginx)

<pre>
	location ~ /.well-known {
                allow all;
	}
</pre>

<code>
	service nginx reload
</code>

Ask for a new certificate:

<code>
	certbot certonly --non-interactive --agree-tos --email nelis@archiwise.com --domains test1.test.boucke.be --webroot --webroot-path /var/www/html/test1.test.boucke.be/
</code>

Update the config with the https settings [example](nginx-conf/test1.2.nginx.site)

<code>
	service nginx reload
</code>		

## Let's encrypt with Caddy

docker-compose -f docker-compose-caddy.yml up -d


