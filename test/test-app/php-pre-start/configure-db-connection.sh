#!/bin/sh
# user     = ""
# password = ""
# dbname   = ""
# host     = ""
# ;port     = 
# ;unix_socket = 
# ;log_path = 


echo "user = ${db_user}" > /opt/app-root/src/omeka-s/config
echo "password = ${db_password}" > /opt/app-root/src/omeka-s/config
echo "dbname = ${db_name}" > /opt/app-root/src/omeka-s/config
echo "host = ${db_host}" > /opt/app-root/src/omeka-s/config

