FROM ubuntu:latest

### Prepare for installation
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y --no-install-recommends apt-utils dialog

### Set US locale
RUN apt install -y locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

### System libraries and tools
RUN apt install -y curl lsb-release ssh nano libssl-dev libcurl4-openssl-dev

### Python
RUN apt install -y python-is-python3 python3 python3-pip
RUN pip3 install --upgrade pip

### R
RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu "`lsb_release -sc`"-cran40/" >>  /etc/apt/sources.list   
RUN apt install -y dirmngr --install-recommends
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt update
RUN apt install -y r-base r-base-dev

### Packages
RUN apt install -y git dos2unix pdftk pandoc pandoc-citeproc libxml2-dev
RUN R -e 'install.packages(c("tidyverse", "devtools", "reticulate", "renv"))'
RUN pip install numpy scipy matplotlib pandas

### Startup and Configuration
RUN echo "root:rep" | chpasswd
RUN adduser --disabled-password --gecos "" rep 
RUN rm /home/rep/.bashrc /home/rep/.bash_logout /home/rep/.profile
RUN echo 'if [ ! -f ~/.profile ]; then . /etc/skel/.profile; fi' >> /etc/profile
RUN echo 'if [ ! -f ~/.bashrc ]; then . /etc/skel/.bashrc; fi' >> /etc/profile
RUN mkdir /startup
RUN git clone "https://github.com/johanngb/rep.git"
RUN cp -r rep/rep-base/startup/* /startup
RUN rm -rf rep
RUN chmod +x /startup/*.sh

### Clean up after installation
RUN apt clean
RUN rm -rf /root/.cache
RUN rm -rf /tmp/*
ENV DEBIAN_FRONTEND teletype

WORKDIR /startup
CMD ["bash", "/startup/startup.sh"]
