FROM httpd:2.4

COPY index.html /usr/local/apache2/htdocs

# Adicionar configuração do Apache
COPY httpd-status.conf /usr/local/apache2/conf/extra/httpd-status.conf

# Incluir a configuração no httpd.conf
RUN echo 'Include /usr/local/apache2/conf/extra/httpd-status.conf' >> /usr/local/apache2/conf/httpd.conf