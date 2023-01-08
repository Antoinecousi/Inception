# ==> Create a container from DEBIAN
FROM debian:buster

# ==> MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# ==> Install NGinx server 
RUN apt install nginx -y

# ==> Install OpenSSL to generate a self-signed certificate
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed certificate and key
# req stands out for REQuest from "certificate  signing request" 
# https://www.globalsign.com/en/blog/what-is-a-certificate-signing-request-csr
# new RSA key on 4096 bit which will last 365 days, private key will not be encrypted (-nodes)
# x509 will make the certificate self-signed in comparison to a authority certificate so you
# need to manually import it to establish the connection with the server
# that's why you need to trust the connexion in the navigator.
# subj specify the name of the certificate when the auto-signed certif generates.
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=Inception/OU=Inception/CN=acousini.42.fr/UID=acousini" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
# changing the ownership of var/www/html so 'www-data' can access this folder. It's the default name of the nginx process user.
# www-data is a common used name in UNIX like systems. could have been 'nobody' or 'http'. 

# Start nginx service (daemon = background process) but in the foreground so
# you can close the container when the nginx service is terminated.
CMD [ "nginx", "-g", "daemon off;" ]