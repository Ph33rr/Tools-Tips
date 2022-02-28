#!/bin/bash



Help()
{
   # Display Help
   echo ""
   echo "                       Wordlist events and elments "
   echo "                                                   "
   echo "                                    XSS "
   echo""
   echo "                                @infosec_90"
   echo""
   echo "         Syntax: $0 -h > events.txt"
   echo "                 $0 -m | anytool   "
   echo ""
   echo "         options:"
   echo ""
   echo "                 -h     Help"
   echo "                 -e     All Event Handlers."
   echo "                 -m     All Elements"
   echo "                 -v     Print software ver."
   echo
}


# Request the MDN Documentation with all the Event Handlers
Events() {
requestEvent="$(curl -s https://developer.mozilla.org/en-US/docs/Web/Events)"

         echo "$requestEvent"|\
         grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' | \
         sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i'|\
         cut -d "#" -f 1|awk '/_event/&&/docs/&&/API/{print $1}'|\
         awk -F "/" '{print $7}'|cut -d "_" -f 1|sed -e '/^$/d'|awk '{print "on" $0}'|uniq
   
   }
   
#Request the MDN Documentation with all the Elements

Elements(){
requestElement="$(curl -s https://developer.mozilla.org/en-US/docs/Web/HTML/Element)"

         echo "$requestElement"|\
		 grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' |\
		 sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i'|\
		 cut -d "#" -f 1|awk '/HTML/&&/Web/{print $1}'|\
		 sed -e '/http/d'|awk -F "/" '{print $7}'|sed -e '/^$/d'|uniq
		 
	    }
ABC(){
     sed -e 's/o/O/' -e 's/e/E/' -e 's/s/S/' -e 's/r/R/' -e 's/t/T/' -e 's/a/A/'
}
		
while getopts "h|e|m|" option; do
   case $option in
      h) # display Help
         Help
         ;;
      e) # List Event
	 Events|ABC
         ;;
      m) # List Elements
         Elements|ABC
	  ;;
     \?) # Invalid option
         echo "Error: Invalid option -h"
          Help
          ;;
		 
   esac
done
