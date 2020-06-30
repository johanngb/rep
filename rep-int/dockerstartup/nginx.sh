if [ -f "/home/docker/docker/nginx.conf" ]; then
    cp /home/docker/docker/nginx.conf /etc/nginx/nginx.conf
else 
    cp /dockerstartup/nginx_default.conf /etc/nginx/nginx.conf
fi 
if [ -f "/home/docker/docker/index.Rmd" ]; then
    R -e 'rmarkdown::render("/home/docker/docker/index.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
else 
    R -e 'rmarkdown::render("/dockerstartup/index_default.md", output_format="html_document", output_dir="/var/www/html", output_file="index.html")' &> /dev/null
fi 
service nginx start &> /dev/null &
