/usr/sbin/mysqld &
sleep 5
mysql -uroot -e "CREATE DATABASE ${WPDB}"
mysql -uroot -e "GRANT All PRIVILEGES ON ${WPDB}.* TO ${WPUSER} IDENTIFIED BY '${WPPASS}';"
mysql -uroot -e "FLUSH PRIVILEGES;"

#create the admin user

echo -e "Creating Admin user\n"
ADMIN_UN='admin'
ADMIN_PASS=`pwgen -s 12 1`
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO $ADMIN_UN IDENTIFIED BY '$ADMIN_PASS';"
mysql -uroot -e "FLUSH PRIVILEGES;"
echo -e "DONE .... \n"
echo -e "USERNAME = $ADMIN_UN \n"
echo -e "PASSWORD = $ADMIN_PASS \n"

# stop and restert mysql in foreground

mysqladmin shutdown
/usr/sbin/mysqld
