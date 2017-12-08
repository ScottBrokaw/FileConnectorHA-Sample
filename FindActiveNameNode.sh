#!/bin/sh

############################################################################
# Configurables
############################################################################
# Value File:
valueFile=/opt/IBM/InformationServer/Server/Projects/dstage1/ParameterSets/WebHDFS/NameNode_ValueFile
# Kerberos Principal:
kerberosPrincipal=dsadm/Clifford
# Keytab:
keytab=/home/dsadm/dsadm.keytab

############################################################################
############################################################################


## Main script starts here ##
############################################################################
############################################################################
############################################################################

# Test for Kerberos
## Checks to see if the user has a valid Kerberos ticket.
## If not, check to see if Kerberos is even required for Hadoop
hdfs dfs -ls 2>&1|grep -q "Failed to find any Kerberos tgt"
isKerberos=$?
if [ $isKerberos -eq 0 ]; then
    # Acquire a ticket:
    kinit $kerberosPrincipal -kt $keytab
fi

for NameNode in `hdfs getconf -namenodes`; do
if hdfs dfs -test -e hdfs://$NameNode 2> /dev/null; then 
    sed -i -e "s/NameNode=.*/NameNode=$NameNode/g" $valueFile
fi
done