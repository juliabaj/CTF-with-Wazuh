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
      wordlists && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean \

CMD ["tail", "-f", "/dev/null"]


# Skrypt inicjujący atak
COPY attack.sh /usr/local/bin/attack.sh
RUN chmod +x /usr/local/bin/attack.sh

# Uruchomienie skryptu ataku
CMD /usr/local/bin/attack.sh
