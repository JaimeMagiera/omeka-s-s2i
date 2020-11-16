#!/bin/sh
# user     = ""
# password = ""
# dbname   = ""
# host     = ""
# ;port     = 
# ;unix_socket = 
# ;log_path = 

CONFIG_FILE=/opt/app-root/src/omeka-s/config/database.ini
echo -e "user = \"${database\-user}\"" > ${CONFIG_FILE}
echo -e "password = \"${database\-password}\"" >> ${CONFIG_FILE}
echo -e "dbname = \"${database\-name}\"" >> ${CONFIG_FILE}
echo -e "host = \"${db_host}\"" >> ${CONFIG_FILE}

