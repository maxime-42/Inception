#! /bin/bash
# | Container start | -> |start mysqls serivce| -> | Checks if exists -> executes them | -> | start mysqld server
service mysql start #will re-run if conainer crash
#both if conditions runs one time ever
# -- run mysql_secure dialog automated script via expect
if [[ $(ls ~/mysql_secure.exp | wc -c) -ne 0 ]]; then expect ~/mysql_secure.exp && rm -rf ~/mysql_secure.exp; fi

# -- Changing placeholder values in mysql_template.sh to .env values to get the final script(not using direct env expension to avoid syntax errors)
if [[ $(ls ~/mysql_template.sh | wc -c) -ne 0 ]];
then
	RUN chown -R 1001 /tmp/mysql #To avoid mysql crash because of permissions
	cp ~/mysql_template.sh ~/mysql_script.sh
	chmod 777 ~/mysql_script.sh
	# -- replacing placeholder values below
	sed -i "s/__DB_NAME__/${DB_NAME}/g" ~/mysql_script.sh
	sed -i "s/__DB_PSWD__/${DB_PSWD}/g" ~/mysql_script.sh
	sed -i "s/__DB_USER__/${DB_USER}/g" ~/mysql_script.sh
	cat ~/mysql_script.sh #displaying final script (to check errors)
	~/./mysql_script.sh
	# -- delete template and script (one time run)
	rm -rf ~/mysql_template.sh
	rm -rf ~/mysql_script.sh
fi
mysqld --user=root
