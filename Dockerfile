FROM nginx:1.13.1

# Ensure package is available on OS level
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && apt-get update

# Ensure certbot is installed
RUN apt-get install certbot -t jessie-backports -y

RUN certbot certonly --non-interactive --agree-tos --email nelis@co-learning.be --webroot -w /usr/share/nginx/html -d test1.test.boucke.be


