FROM johanngb/rep-base:latest

### Prepare for installation
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y gdebi-core 
WORKDIR /tmp

### Nginx
RUN apt install -y nginx apache2-utils

### Jupyter
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN pip install jupyter
RUN pip install jupyterlab
RUN pip install jupytext
RUN jupyter lab build
RUN apt install libunwind8
RUN R -e 'install.packages("IRkernel")'
RUN runuser - docker --command='R -e "IRkernel::installspec()"'

### R Studio
RUN wget "https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb"
RUN gdebi --n rstudio-server-1.4.1103-amd64.deb
RUN rm rstudio-server-1.4.1103-amd64.deb
RUN printf '\n.libPaths(c("~/R/x86_64-pc-linux-gnu-library/4.0/","/usr/local/lib/R/site-library"))\n\n' >> /usr/lib/R/etc/Rprofile.site

### Shiny
RUN R -e 'install.packages(c("shiny"))'
RUN wget "https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb"
RUN gdebi --n shiny-server-1.5.16.958-amd64.deb
RUN rm shiny-server-1.5.16.958-amd64.deb

### Startup and Configuration
RUN mkdir /startup
RUN git clone "https://github.com/johanngb/rep.git"
RUN cp -r rep/rep-int/startup/* /startup
RUN rm -rf rep
RUN chmod +x /startup/*.sh

### Clean up after installation
RUN apt clean
RUN rm -rf /root/.cache
RUN rm -rf /tmp/*
ENV DEBIAN_FRONTEND teletype

WORKDIR /startup
CMD ["bash", "/startup/startup.sh"]
