FROM  centos:latest
#MAINTAINER monuprajith47@gmail.com
RUN echo "hello prajeet"
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["bash", "/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
