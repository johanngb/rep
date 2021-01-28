if [ -f "/home/rep/docker/nginx.conf" ]; then
    cp /home/rep/docker/nginx.conf /etc/nginx/nginx.conf
else 
    cp /startup/nginx_default.conf /etc/nginx/nginx.conf
fi 
if [ -f "/home/rep/docker/index.md" ]; then
    R -e 'rmarkdown::render("/home/rep/docker/index.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
else 
    R -e 'rmarkdown::render("/startup/index_default.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
fi 
service nginx start &> /dev/null &
