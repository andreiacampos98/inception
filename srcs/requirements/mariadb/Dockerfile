#A próxima versão do Debian tem o codinome "trixie" — "teste (testing)", — nenhuma data de lançamento foi definida
#Debian 12 ("bookworm") — versão "estável (stable)" atual
#Debian 11 ("bullseye") — versão "estável antiga (oldstable)" atual 
FROM debian:bullseye

#Update the mariadb software. Install mariadb.
#Flag -y => automatic yes to prompts. 
#Assume "yes" as answer to all prompts and run non-interactively.

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./conf/conf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 3306

#CMD ["executable", "parameter1", "parameter2"]
CMD ["/script.sh"]
