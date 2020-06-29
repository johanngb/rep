if [ -f "/home/docker/docker/startup.sh" ]; then
    chmod +x /home/docker/docker/startup.sh
    /home/docker/docker/startup.sh
else 
    /dockerstartup/startup_default.sh
fi 
