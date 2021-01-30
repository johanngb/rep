if [ -f "/home/rep/docker/startup/rserver.conf" ]; then
    cp /home/rep/docker/startup/rserver.conf /etc/rstudio/rserver.conf
else 
    cp /startup/rserver_default.conf /etc/rstudio/rserver.conf
fi 
export USER=rep
/usr/lib/rstudio-server/bin/rserver
