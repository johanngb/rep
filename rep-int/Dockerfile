FROM johanngb/rep-base:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y gdebi-core 
WORKDIR /tmp

### Nginx
RUN apt install -y nginx

### Jupyter
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install -y nodejs
RUN pip install jupyter
RUN pip install jupyterlab
RUN pip install jupytext
RUN jupyter lab build
RUN apt install libunwind8
RUN R -e 'install.packages("IRkernel")'
RUN runuser - docker --command='R -e "IRkernel::installspec()"'

### R Studio
RUN wget "https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.959-amd64.deb"
RUN gdebi --n rstudio-server-1.3.959-amd64.deb
RUN rm rstudio-server-1.3.959-amd64.deb

### Shiny
RUN R -e 'install.packages(c("shiny"))'
RUN wget "https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.13.944-amd64.deb"
RUN gdebi --n shiny-server-1.5.13.944-amd64.deb
RUN rm shiny-server-1.5.13.944-amd64.deb

### Startup and Configuration
RUN mkdir /dockerstartup
RUN git clone "git@github.com:johanngb/rep.git"
RUN cp -r rep/rep-int/dockerstartup/* /dockerstartup
RUN chmod +x /dockerstartup/*.sh
WORKDIR /dockerstartup

### Clean up
RUN apt clean
RUN rm -rf /root/.cache
RUN rm -rf rep

ENV DEBIAN_FRONTEND teletype

CMD ["bash", "/dockerstartup/startup.sh"]
