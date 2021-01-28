if [ -f "/home/rep/docker/startup.sh" ]; then
    chmod +x /home/rep/docker/startup.sh
    /home/rep/docker/startup.sh
else 
    /startup/startup_default.sh
fi 
