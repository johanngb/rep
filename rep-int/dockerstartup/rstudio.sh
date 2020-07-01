if [ -f "/home/docker/docker/rserver.conf" ]; then
    cp /home/docker/docker/rserver.conf /etc/rstudio/rserver.conf
else 
    cp /dockerstartup/rserver_default.conf /etc/rstudio/rserver.conf
fi 
export USER=docker
printf '\n.libPaths("/usr/local/lib/R/site-library")\n\n' >> /usr/lib/R/etc/Rprofile.site
/usr/lib/rstudio-server/bin/rserver
