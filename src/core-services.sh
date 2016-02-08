#!/bin/bash


# Constants
PREFIX="-->";
LOG="./backups/install.log";


# INSTALL CORE SERVICES
#######################

echo "$PREFIX Installing core services";

echo "- UFW - Uncomplicated Firewall";
apt-get install -y ufw >> "$LOG";

echo "- mlocate";
apt-get install -y mlocate >> "$LOG";

echo "- GCC & G++";
apt-get install -y gcc g++ >> "$LOG";


# INSTALL WEB SERVICES
######################

echo "$PREFIX Installing core services";

echo "- NGINX";
apt-get install -y nginx >> "$LOG";

echo "- MySQL-SERVER-5.5";
apt-get install -y mysql-server-5.5 >> "$LOG";

echo "- PHP5";
apt-get install -y php5 >> "$LOG";

echo "- PHP5-FPM";
apt-get install -y php5-fpm >> "$LOG";

echo "- PHP5-MYSQLND";
apt-get install -y php5-mysqlnd >> "$LOG";

echo "- PHP5-JSON";
apt-get install -y php5-json >> "$LOG";

echo "- NODEJS";
apt-get install -y nodejs >> "$LOG";

echo; 
echo "$PREFIX Installation Complete.";
echo;
echo;
