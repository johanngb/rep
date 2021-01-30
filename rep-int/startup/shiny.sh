if [ -f "/home/rep/docker/startup/shiny-server.conf" ]; then
    cp /home/rep/docker/startup/shiny-server.conf /etc/shiny-server/shiny-server.conf
else 
    envsubst < ./shiny-server_default.conf > /etc/shiny-server/shiny-server.conf
fi 
shiny-server &> /dev/null &
