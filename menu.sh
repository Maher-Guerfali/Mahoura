cat functions.sh
helpp()
{
echo " -l  for show users "
echo "-p  (username/UUID) to change that user  password "
echo "-decrypt  -user  for decrypting that user password"
echo "-s  to save decrypted password in your local folder" 

}
lister()
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


while true
do
  #..........................................................................
  # affichage
  #..........................................................................
  clear
  echo " MENU OF CHOICES

 1 -- \t  Lister

 2 -- \t changer password
 3 -- \t decryptage and show result
 4 -- \t save decrypted password
 5 -- \t leave
 Entrez une lettre (parmi les choix possibles)
 puis tapez RETURN \c"

  #..........................................................................
  # saisie d une touche et gestion
  #..........................................................................
  read answer
  clear

  case "$answer" in
    [1]*) lister ;;
    [2]*) passswd ;;
    [3]*) decrypter ;;
    [4]*) save ;;
    [5]*) echo "leave" ; exit 0 ;;
    *)      echo "Choisissez une option affichee dans le menu:" ;;
  esac
  echo ""
  echo "tapez RETURN pour le menu"
  read dummy
done
