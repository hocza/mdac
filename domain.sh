#!/bin/bash
#####Configuration //

###SLEEP
#By default the script uses a 500ms delay. 
#For some whois servers you should increase this limit
#sleep=seconds
sleep=0.5

#####Configuration \\

trap ctrl_c INT

function ctrl_c() {
        echo -e "\e[39m** Exiting..."
        exit
}

#LOOK FOR WHOIS COMMAND
if ! whois_loc="$(type -p "whois")" || [ -z "$whois_loc" ]; then
  echo "Whois is missing"
  sleep 1
  echo "Now we're going to apt-get install whois"
  echo "If you do not have APT, then you should get the whois command."
  sleep 2
  sudo apt-get install whois
fi

if [ -n "$1" ] ; then
  
  ok=true
  if [ -n "$3" ] ; then
    list=`cat $3`
  else
    list=`echo {a..z}{a..z}{a..z}`
  fi
else
  echo 'Mass Domain Availability Checker Script 0.0.1'
  echo '2014 - Jozsef Hocza <jozsef@hocza.com>'
  echo 'Github: github.com/hocza/'
  echo '--------------------------'
  echo 'The script by default checks the permutation of 3 characters. (a..z)'
  echo 'Or, you can use your own dictionary'
  echo 'e.g.: ./domain.sh co "Not found" mylist'
  echo '--------------------------'
  echo 'Usage: ./domain.sh <TLD> [string] [list]'
  echo '          <TLD>  You have to give the top level domain. 
                 For example: ./domain.sh com'
  echo '       [string]  (Optional) 
                 The string that indicates 
                 that the domain is not taken.
                 For example: ./domain.sh com "Not found"
                 Default is: "Not found"'
  echo '         [list]  (Optional) 
                 Custom domain list/dictionary.
                 You can use your own word list.'
fi

if [ -n "$2" ] ; then
  string=$2
else
  string="Not found"
fi

if [ $ok ] ; then
  #debug
  #echo "String: $string"
  for domain in $list
  do
     #echo $domain
     sleep $sleep
     VAL=`whois $domain.$1`
     #echo $VAL
     if [[ $VAL == *$string* ]]
     then
       echo -e "\e[32m$domain.$1 ******FREE******"
       echo "$domain.$1" >> domain.free
     else
       echo -e "\e[31m$domain.$1 TAKEN :-("
     fi
     #echo $domain >> wanted.results
     #`whois $domain >> wanted.results`
  done
  echo -e "\e[39m"
fi
