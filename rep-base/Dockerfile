FROM ubuntu:rolling

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y --no-install-recommends apt-utils dialog

RUN echo "root:docker" | chpasswd
RUN adduser --disabled-password --gecos "" docker

RUN apt install -y locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt install -y curl lsb-release ssh nano libssl-dev libcurl4-openssl-dev

RUN apt install -y python-is-python3 python3 python3-pip
RUN pip3 install --upgrade pip

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu "`lsb_release -sc`"-cran40/" >>  /etc/apt/sources.list   
RUN apt install -y dirmngr --install-recommends
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt update
RUN apt install -y r-base r-base-dev

RUN apt install -y git dos2unix pdftk pandoc pandoc-citeproc libxml2-dev
RUN R -e 'install.packages(c("tidyverse", "devtools", "reticulate"))'

RUN pip install numpy scipy matplotlib pandas

RUN apt-get clean
RUN rm -rf /root/.cache
ENV DEBIAN_FRONTEND teletype

CMD su -s /bin/bash - docker
