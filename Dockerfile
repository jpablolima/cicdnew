FROM httpd:2.4

RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

COPY . /usr/local/apache2/htdocs 



EXPOSE 80