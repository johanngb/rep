if [ -f "/home/rep/docker/startup/startup.sh" ]; then
    chmod +x /home/rep/docker/startup/startup.sh
    /home/rep/docker/startup/startup.sh
else 
    /startup/startup_default.sh
fi 
