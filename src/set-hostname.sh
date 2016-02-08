#!/bin/bash

PREFIX="-->";
HOSTNAME="/etc/hostname";
HOSTS="/etc/hosts";

clear;

# Output Hostname
echo "Enter your desired hostname, then press [ENTER]"; 
read hostname;

# Output HOSTNAME file
echo "$hostname" > "$HOSTNAME";

# Output HOSTS file
echo "127.0.0.1     localhost" > "$HOSTS";
echo "::1           localhost ip6-localhost ip6-loopback" >> "$HOSTS";
echo "ff02::1       ip6-allnodes" >> "$HOSTS";
echo "ff02::1       ip6-allrouters" >> "$HOSTS";
echo "127.0.0.1     RaspberrySource" >> "$HOSTS";

echo; 
echo "$PREFIX Completed.";
echo; 
