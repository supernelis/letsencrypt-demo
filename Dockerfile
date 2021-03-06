FROM ubuntu:17.04

# Ensure nginx is installed
RUN apt-get update; apt-get install nginx software-properties-common vim -y
RUN add-apt-repository ppa:certbot/certbot; apt-get update; apt-get install python-certbot-nginx -y

VOLUME /var/www/html
VOLUME /etc/letsencrypt

ADD nginx-conf/default.site /etc/nginx/sites-enabled/default

# Add SSL param config: 
ADD nginx-conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

ADD nginx-conf/test1.nginx.site /etc/nginx/sites-available/test1.test.boucke.be
RUN ln -s /etc/nginx/sites-available/test1.test.boucke.be /etc/nginx/sites-enabled/test1.test.boucke.be

# RUN certbot --non-interactive --agree-tos --email nelis@archiwise.com --domains test1.test.boucke.be --nginx

CMD ["nginx", "-g", "daemon off;"]
