if [ -f "/home/rep/docker/startup/nginx.conf" ]; then
    cp /home/rep/docker/startup/nginx.conf /etc/nginx/nginx.conf
else 
    cp /startup/nginx_default.conf /etc/nginx/nginx.conf
fi 
if [ -f "/home/rep/docker/startup/index.md" ]; then
    R -e 'rmarkdown::render("/home/rep/docker/startup/index.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
else 
    R -e 'rmarkdown::render("/startup/index_default.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
fi 
service nginx start &> /dev/null &
