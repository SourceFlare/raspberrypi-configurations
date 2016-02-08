#!/bin/bash

PREFIX="-->";
HOSTNAME="/etc/hostname";

clear;

# Output Hostname
echo "Enter your desired hostname, then press [ENTER]"; 
read hostname;
echo "$hostname" > "$HOSTNAME";

echo "$PREFIX Completed.";
