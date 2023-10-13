#A próxima versão do Debian tem o codinome "trixie" — "teste (testing)", — nenhuma data de lançamento foi definida
#Debian 12 ("bookworm") — versão "estável (stable)" atual
#Debian 11 ("bullseye") — versão "estável antiga (oldstable)" atual 
FROM debian:bullseye

#Update the mariadb software. Install mariadb.
#Flag -y => automatic yes to prompts. 
#Assume "yes" as answer to all prompts and run non-interactively.

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./conf/conf /etc/mysql/mariadb.conf.d/50-server.conf
RUN chmod -R 755 /var/lib/mysql/

COPY ./tools/script.sh /tmp/mysql_setup.sh

#RUN mysql_secure_installation

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 3306

#CMD ["executable", "parameter1", "parameter2"]
ENTRYPOINT ["sh", "/tmp/mysql_setup.sh"]
