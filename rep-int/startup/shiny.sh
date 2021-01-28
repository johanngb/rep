if [ -f "/home/rep/docker/shiny-server.conf" ]; then
    cp /home/rep/docker/shiny-server.conf /etc/shiny-server/shiny-server.conf
else 
    cp /startup/shiny-server_default.conf /etc/shiny-server/shiny-server.conf
fi 
shiny-server &> /dev/null &
