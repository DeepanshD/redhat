#!/bin/bash

#install git, java, python, jenkins, nagios, tomcat

for i in git java python jenkins nagios tomcat
do
rpm -qa|grep -i $i >/dev/null 2>&1

if  [ $? -eq 0 ]

then
 	 
               echo -e "I require \033[1m $i \033[0m and it's already installed.  \033[1m Skipping Installation of $i.\033[0m"
else
                yum -y install $i  > /dev/null 2>&1 &
                clear
                printf "\x1b[5m Installing $i .... \x1b[25m"
                wait $!
                systemctl enable $i 
                service $i start
fi
echo
echo 


#command -v `rpm -qa | grep -i $i` >/dev/null 2>&1 || { echo -e >&2 " I require \033[1m $i \033[0m and it's already installed.  \033[1m Skipping Installation of $i.\033[0m";  }

done
