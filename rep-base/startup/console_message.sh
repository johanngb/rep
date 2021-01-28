if [ -f "/home/rep/docker/console_message.txt" ]; then
    echo -e "$(cat /home/rep/docker/console_message.txt)"    
else 
    echo -e "$(cat /startup/console_message_default.txt)"        
fi 

