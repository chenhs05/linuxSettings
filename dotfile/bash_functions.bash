#!/usr/bin/env bash

##########################
## CPU Governor setting ##
##########################

# Set cpu governor to powersave
function setCpuGovPowersave ()
{
     for i in {0..3}; 
     do 
         sudo cpufreq-set -c $i -g powersave; 
     done
}
# Set cpu governor to performance
function setCpuGovPerformance ()
{
     for i in {0..3}; 
     do 
         sudo cpufreq-set -c $i -g performance; 
     done
}


#######################################################
## Annoying PageUp PageDown is too close to up/down. ##
## Disable and enable the keys                       ##
#######################################################

function setKeyPageUpDownOff {
	#echo "Disable the annoying PageUp PageDown key..."
	xmodmap -e 'keycode 112 = '
	xmodmap -e 'keycode 117 = '
}

function setKeyPageUpDownOn {
	#echo "Enable the PageUp PageDown key..."
	xmodmap -e 'keycode 112 = Prior NoSymbol Prior'
	xmodmap -e 'keycode 117 = Next NoSymbol Next '
}


################################################################
## switching the proxy settings REALLY GLOBALLY               ##
## changed from https://gist.github.com/fernando-basso/635204 ##
################################################################

# gsettings list-recursively org.gnome.system.proxy

# Change de ip address and port number accordingly.
# for gtk3 programs
function setProxyOn() {
	proxy_server='proxy.kip.uni-heidelberg.de'

	# ' manual / nome / automatic '
	gsettings set org.gnome.system.proxy mode 'manual' 

## the proxy server infomation should be loaded automatically as last configuration
#	gsettings set org.gnome.system.proxy.http host ${proxy_server}
#	gsettings set org.gnome.system.proxy.http port 8080
#	gsettings set org.gnome.system.proxy.https host ${proxy_server}
#	gsettings set org.gnome.system.proxy.https port 8080
#	gsettings set org.gnome.system.proxy.ftp host ${proxy_server}
#	gsettings set org.gnome.system.proxy.ftp port 2121 
#	gsettings set org.gnome.system.proxy.socks host ${proxy_server}
#	gsettings set org.gnome.system.proxy.socks port 1080

	echo "System wides GTK3 program proxy set to ${proxy_server}."
	unset proxy_server

	## set the proxy for the environment variables
	export http_proxy=http://proxy.kip.uni-heidelberg.de:8080
	export https_proxy=https://proxy.kip.uni-heidelberg.de:8080 
	export ftp_proxy=ftp://proxy2.kip.uni-heidelberg.de:2121
	echo "set proxy environment variables."
}

function setProxyOff() {
	# ' manual / nome / automatic '
	gsettings set org.gnome.system.proxy mode 'none'
	echo "system-wides gtk3 program proxy set to 'none'."

	# unset the proxy for the environment variables
	unset http_proxy https_proxy ftp_proxy
	echo "unset proxy environment variables."
}
