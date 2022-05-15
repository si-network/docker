#!/bin/bash

mysql -u root -p777777 -e "CREATE DATABASE store_db;"
mysql -u root -p777777 store_db < /dump.sql
# mysql -u root -p777777 -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"