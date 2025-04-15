FROM ubuntu:20.04

# Ustawienie zmiennych środowiskowych
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw

# Instalacja pakietów i konfiguracja strefy czasowej
RUN apt-get update && \
    apt-get install -y \
        openssh-client \
        hydra \
        tzdata \
        curl \
        unzip && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean

# Skrypt inicjujący atak
COPY attack.sh /attack.sh
RUN chmod +x /attack.sh

# Skopiowanie wordlista
COPY passwords.txt /usr/share/wordlists/passwords.txt

# Uruchomienie skryptu ataku
CMD ["/attack.sh"]
