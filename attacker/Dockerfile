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


# Skrypt inicjujący atak
#COPY attack_script.sh /usr/local/bin/attack_script.sh
#RUN chmod +x /usr/local/bin/attack_script.sh

# Uruchomienie skryptu ataku
#CMD /usr/local/bin/attack_script.sh
