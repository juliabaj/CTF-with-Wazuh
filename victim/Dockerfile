FROM ubuntu:20.04

# Ustawienie zmiennych środowiskowych
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw

# Instalacja pakietów i konfiguracja strefy czasowej
RUN apt-get update && \
    apt-get install -y \
            openssh-server \
            apache2 \
            tzdata \
            curl \
            gnupg && \
    apt-get clean && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

CMD ["tail", "-f", "/dev/null"]

# Instalacja agenta Wazuh
RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
    echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && apt-get install -y wazuh-agent \

# Konfiguracja SSH
RUN mkdir /var/run/sshd && \
RUN echo 'root:password' | chpasswd
    useradd -m victim && echo 'victim:victim' | chpasswd \

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Eksponowanie portów
EXPOSE 22 80

# Ustawienie domyślnego entrypointu
ENTRYPOINT ["/entrypoint.sh"]

# Uruchomienie usług SSH i Apache
#CMD service ssh start && service apache2 start && tail -f /dev/null

