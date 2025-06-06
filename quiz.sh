#!/bin/bash

echo "Odpowiedz na poniższe pytania. Wpisz odpowiedź i naciśnij ENTER."

score=0

echo ""
read -p "1. Czy Wazuh zarejestrował próbę brute-force SSH? (tak/nie): " a1
if [[ "$a1" =~ ^[Tt]ak$ ]]; then
    ((score++))
fi

echo ""
read -p "2. Jakie polecenie było użyte do wykonania skanowania portów? (np. nmap ...): " a2
if [[ "$a2" == *"nmap"* && "$a2" == *"-sS"* ]]; then
    ((score++))
fi

echo ""
read -p "3. Czy wykryto próbę przesłania pliku na serwer (upload)? (tak/nie): " a3
if [[ "$a3" =~ ^[Tt]ak$ ]]; then
    ((score++))
fi

echo ""
read -p "4. Jaki był adres IP maszyny ofiary? (np. 192.168.56.101): " a4
if [[ "$a4" == "192.168.56.101" ]]; then
    ((score++))
fi

echo ""
read -p "5. Czy wystąpiły alerty związane z atakiem DoS (ping flood)? (tak/nie): " a5
if [[ "$a5" =~ ^[Tt]ak$ ]]; then
    ((score++))
fi

echo ""
echo " Twój wynik: $score/5"

if [[ "$score" -eq 5 ]]; then
    echo "Zidentyfikowałeś wszystkie zdarzenia poprawnie."
else
    echo "Spróbuj jeszcze raz."
fi
