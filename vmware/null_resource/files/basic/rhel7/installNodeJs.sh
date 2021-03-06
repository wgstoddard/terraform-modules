#!/bin/bash
#################################################################
# Script to install Node.js only
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2017.
#
#################################################################

set -o errexit
set -o nounset
set -o pipefail

LOGFILE="/var/log/install_nodejs.log"

echo "---start installing node.js---" | tee -a $LOGFILE 2>&1 

#echo "---update system---" | tee -a $LOGFILE 2>&1 
#yum update -y                                             >> $LOGFILE 2>&1 

yum install gcc-c++ make -y                               >> $LOGFILE 2>&1 || { echo "---Failed to install build tools---" | tee -a $LOGFILE; exit 1; }
curl -sL https://rpm.nodesource.com/setup_7.x | bash -    >> $LOGFILE 2>&1 || { echo "---Failed to install the NodeSource Node.js 7.x repo---" | tee -a $LOGFILE; exit 1; }
yum install nodejs -y                                     >> $LOGFILE 2>&1 || { echo "---Failed to install node.js---"| tee -a $LOGFILE; exit 1; }

echo "---finish installing node.js---" | tee -a $LOGFILE 2>&1 
