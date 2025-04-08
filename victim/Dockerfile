FROM ubuntu:20.04

# Ustawienie zmiennych środowiskowych
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw

# Instalacja pakietów i konfiguracja strefy czasowej
RUN apt-get update && \
    apt-get install -y openssh-server apache2 tzdata && \
    apt-get clean && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

CMD ["tail", "-f", "/dev/null"]


# Konfiguracja SSH
#RUN mkdir /var/run/sshd
#RUN echo 'root:password' | chpasswd

# Eksponowanie portów
#EXPOSE 22 80

# Uruchomienie usług SSH i Apache
#CMD service ssh start && service apache2 start && tail -f /dev/null
