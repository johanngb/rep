if [ -f "/home/docker/docker/shiny-server.conf" ]; then
    cp /home/docker/docker/shiny-server.conf /etc/shiny-server/shiny-server.conf
else 
    cp /dockerstartup/shiny-server_default.conf /etc/shiny-server/shiny-server.conf
fi 
shiny-server &> /dev/null &
