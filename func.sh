if [[ $1 = "-l" ]]; then
yad --list --column users $(awk -F: '$3>999 && $3<1200{print $1}' /etc/passwd) --height 300
fi


