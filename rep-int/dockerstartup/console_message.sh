if [ -f "/home/docker/docker/console_message.txt" ]; then
    echo -e "$(cat /home/docker/docker/console_message.txt)"    
else 
    echo -e "$(cat /dockerstartup/console_message_default.txt)"        
fi 

