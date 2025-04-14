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

# Pobranie rockyou.txt z repo do brute force (zip)
RUN curl -L https://github.com/danielmiessler/SecLists/archive/refs/heads/master.zip -o /tmp/seclists.zip && \
    unzip /tmp/seclists.zip -d /opt && \
    cp /opt/SecLists-master/Passwords/Leaked-Databases/rockyou.txt.tar.gz /tmp && \
    tar -xvzf /tmp/rockyou.txt.tar.gz -C /usr/share && \
    rm -rf /tmp/*

# Skrypt inicjujący atak
COPY attack.sh /attack.sh
RUN chmod +x /attack.sh

# Uruchomienie skryptu ataku
CMD ["/attack.sh"]
