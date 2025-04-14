#!/bin/bash


# konfiguracja adresu wazuh managera w agencie
sed -i "s|<address>.*</address>|<address>${WAZUH_MANAGER}</address>|" /var/ossec/etc/ossec.conf
# Start SSH i agenta wazuh
service ssh start
/var/ossec/bin/wazuh-control start

# nieskonczona petla do podtrzymania kontenera
tail -f /dev/null