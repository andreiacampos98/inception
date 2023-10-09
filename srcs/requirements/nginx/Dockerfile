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

#create server root dir
RUN mkdir -p /var/www/html

# adding wordpress server config file in sites-available
#the commands ln links the file designated in the source file with the target directory
COPY ./conf/wordpress /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

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
RUN mkdir -p etc/ssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/anaraujo.crt \
       -keyout /etc/ssl/private/anaraujo.key \
       -subj "/C=PT/ST=Porto/L=Porto/0=42Porto/OU=Inception/CN=www.anaraujo.42.fr"

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 443

#CMD ["executable", "parameter1", "parameter2"]
CMD ["nginx", "-g", "daemon off;"]

#https://docs.docker.com/engine/reference/builder/
#Nginx is a webserver which stores hmtl, js, images files and use http request to display a website. 
#Nginx conf documents will be used to config our server and the right proxy connexion.