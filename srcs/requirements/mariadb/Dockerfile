#A próxima versão do Debian tem o codinome "trixie" — "teste (testing)", — nenhuma data de lançamento foi definida
#Debian 12 ("bookworm") — versão "estável (stable)" atual
#Debian 11 ("bullseye") — versão "estável antiga (oldstable)" atual 
FROM debian:bullseye

#Update the NGINX software. Install NGINX.
#Flag -y => automatic yes to prompts. 
#Assume "yes" as answer to all prompts and run non-interactively.

RUN apt-get update
RUN apt-get install -y nginx\
    openssl

#Install ssl
#Installing an SSL Certificate on NGINX ensures a safe connection between your web server and browser. 
#openssl – activates the OpenSSL software
#req – indicates that we want a CSR
#–new –newkey – generate a new key
#rsa:2048 – generate a 2048-bit RSA mathematical key
#–nodes – no DES, meaning do not encrypt the private key in a PKCS#12 file
#–keyout – indicates the domain you’re generating a key for
#–out – specifies the name of the file your CSR will be saved as
#https://www.digicert.com/kb/csr-ssl-installation/nginx-openssl.htm
RUN mkdir etc/nginx/ssl
#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout /etc/nginx/ssl/anaraujo.key -out /etc/nginx/ssl/anaraujo.crt
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/raccoman.pem \
        -keyout /etc/nginx/ssl/raccoman.key \
        -subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=raccoman/CN=raccoman/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 443

#CMD ["executable", "parameter1", "parameter2"]
CMD ["nginx", "-g", "daemon off;"]

#https://docs.docker.com/engine/reference/builder/
#Nginx is a webserver which stores hmtl, js, images files and use http request to display a website. 
#Nginx conf documents will be used to config our server and the right proxy connexion.