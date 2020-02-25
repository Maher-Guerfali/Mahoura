#$ cat main.sh 
#!/bin/sh

if  [[ $1 = "-l" ]]; then
    echo "Option -l turned on"
yad --image dialog-question --title John_The_Ripper --button=Show:0 --text "Show users"
cut -f1 -d: /etc/passwd
elif [[ $1 = "-p" ]]; then
sudo passwd $2
elif [[ $1 = "-decrypt" ]]; then
sudo unshadow /etc/passwd /etc/shadow > pass.txt
sudo /usr/sbin/unshadow /etc/passwd /etc/shadow > /tmp/crack.password.db
john --users=$2 passwords.txt
elif [[ $1 = "-s" ]]; then
sudo cp /home/eva/.john/john.pot /home/eva/maher
sudo cp /home/eva/maher/passwords.txt /home/eva
elif [[ $1 = "-help" ]] || [[ $1 = "-h" ]]; then
echo " -l  for show users "
echo "-p  (username/UUID) to change that user  password "
echo "-decrypt  -user  for decrypting that user password"
echo "-s  to save decrypted password in your local folder" 
else 
echo "bye"
fi
