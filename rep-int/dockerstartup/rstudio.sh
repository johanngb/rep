if [ -f "/home/docker/docker/rserver.conf" ]; then
    cp /home/docker/docker/rserver.conf /etc/rstudio/rserver.conf
else 
    cp /dockerstartup/rserver_default.conf /etc/rstudio/rserver.conf
fi 
export USER=docker
/usr/lib/rstudio-server/bin/rserver
