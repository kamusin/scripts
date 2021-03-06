#!/bin/bash
#
# The reason of creating this script is that Endpoint Security VPN installs it's own application firewall kext cpfw.kext
# which prevents for example PPTP connections from this computer, which is not appropriate if you need subj connection just
# from time to time
# Usage: checkpoint.sh load|unload
# You will need sudo power, of course
#
 
if [ $1 == "unload" ]
then
    killall Endpoint_Security_VPN
    killall TrGui
    killall TrGUI;
fi
sudo launchctl $1 /Library/LaunchDaemons/com.checkpoint.epc.service.plist && sudo kext$1  /System/Library/Extensions/cpfw.kext
if [ $1 == 'load' ]
        then
	    /Applications/Endpoint\ Security\ VPN.app/Contents/MacOS/Endpoint_Security_VPN 2>1 > /dev/null &
fi
