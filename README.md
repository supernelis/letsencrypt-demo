# letsencrypt-demo
Demo of setting up lets encrypt for nginx

docker exec -u 0 -it webserver /bin/bash



Manual steps

- Make a location configuration under /etc/nginx/snippets/ so lets encrypt can put a challenge [see here](lets-well-known.conf)

- Include the following line in the unsecure website [see here for example](test2.2.nginx.site)

 include snippets/lets-well-known.conf;
 
- Reload nginx

service nginx reload

- Run certbot

certbot certonly --non-interactive --agree-tos --email nelis@archiwise.com --domains test2.test.boucke.be --webroot --webroot-path /var/www/html/test2.test.boucke.be/

- Make a key configuration file under /etc/nginx/snippets/ that contains the location of the keys [see here for an example](ssl-test2.test.boucke.be.conf)

ssl_certificate /etc/letsencrypt/live/test2.test.boucke.be/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/test2.test.boucke.be/privkey.pem;

- Update the site configuration to be served over ssl [see here for example](test2.3.nginx.site)

