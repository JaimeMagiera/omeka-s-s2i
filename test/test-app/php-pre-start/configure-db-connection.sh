#!/bin/sh
# user     = ""
# password = ""
# dbname   = ""
# host     = ""
# ;port     = 
# ;unix_socket = 
# ;log_path = 

CONFIG_FILE=/opt/app-root/src/omeka-s/config/database.ini
echo "user = ${db_user}" > ${CONFIG_FILE}
echo "password = ${db_password}" >> ${CONFIG_FILE}
echo "dbname = ${db_name}" >> ${CONFIG_FILE}
echo "host = ${db_host}" >> ${CONFIG_FILE}

