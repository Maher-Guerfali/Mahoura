lister()
{
yad --list --column users $(awk -F: '$3>999 && $3<1200{print $1}' /etc/passwd ) --height 500
awk -F: '$3>999 && $3<1200{print $1}' /etc/passwd
}
liister()
{
awk -F: '$3>999 && $3<1200{print $1}' /etc/passwd
}

passswd()
{
sudo passwd $2
}
decrypter()
{
sudo unshadow /etc/passwd /etc/shadow > mypasswd
john --show --users=$2 mypasswd
}
save()
{
john --show --users=$2 mypasswd > newpass.txt
}



action=$(yad --width 600 --entry --title "John The Ripper by Maher & Ons" \
    --image=/home/eva/maher/mah.png \
    --button="Help:2" \
    --entry\
    --button="gtk-ok:0" --button="gtk-close:1" \
    --text "Choose action:" \
    --entry-text \
    "Lister" "Change" "Decrypter" "Save")
ret=$?

[[ $ret -eq 1 ]] && exit 0

if [[ $ret -eq 2 ]]; then
echo " -l  for show users "
echo "-p  (username/UUID) to change that user  password "
echo "-decrypt  -user  for decrypting that user password"
echo "-s  to save decrypted password in your local folder"
fi

case $action in
    Lister*) lister ;;
 Change*) read go
sudo passwd $go;;
    Decrypter*) read go
sudo unshadow /etc/passwd /etc/shadow > mypasswd
john --users=$go mypasswd
john --show --users=$go mypasswd ;;
    Save*) read go
john --show --users=$go mypasswd > newpass.txt ;;
        *) exit 1 ;;
esac

eval exec $cmd
