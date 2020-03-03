 cat functions.sh 
#!/bin/sh

if  [[ $1 = "-l" ]]; then
    echo "Option -l turned on"
foo=$(date +"%d %b %Y")
elif [[ $1 = "-p" ]]; then
#passswd()
elif [[ $1 = "-decrypt" ]]; then
decrypter()
elif [[ $1 = "-s" ]]; then
save()
elif [[ $1 = "-help" ]] || [[ $1 = "-h" ]]; then
echo " -l  for show users "
echo "-p  (username/UUID) to change that user  password "
echo "-decrypt  -user  for decrypting that user password"
echo "-s  to save decrypted password in your local folder" 
else 
echo "bye"
fi
