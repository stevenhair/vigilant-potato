# Creates a docker image to amber in it's own container
FROM centos:7.1.1503

#Set Working Directory
WORKDIR "/docker/vigilant-potato"

#Install Prerequisites for Python and Eggs Installations
RUN yum -y --skip-broken groupinstall "Development tools"
RUN yum -y install bzip2-devel \
                   db4-devel \
                   epel-release \
                   gdbm-devel \
                   git \
                   libpcap-devel \
                   ncurses-devel \
                   openssl-devel \
                   readline-devel \
                   sqlite-devel \
                   tar \
                   tk-devel \
                   wget \
                   xz-devel \
                   yum-plugin-remove-with-leaves \
                   zlib-devel \
                   gcc \
                   gcc-c++


RUN yum -y install freetds-devel

##### Install Node.js #####
RUN wget http://nodejs.org/dist/v4.2.6/node-v4.2.6-linux-x64.tar.gz
RUN tar --strip-components 1 -xzf node-v* -C /usr/local
RUN node --version


######  Install Python 3.5  ######

#Download and Unpack Python
RUN wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
RUN tar xf Python-3.5.0.tgz

#Compile and Install Python
RUN Python-3.5.0/configure --prefix=/usr/local --enable-shared
RUN make
RUN make install
RUN echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf
RUN ldconfig

#Set python path so pip knows where to find the eggs
ENV PYTHONPATH="/usr/local/lib/python3.5/site-packages"


ENV COMPOSE_API_VERSION=1.18
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
