FROM nginx

# COPY ./configs/nginx/kibana.conf /etc/nginx/conf.d/mysite.template
RUN apt-get update -y && \
  apt-get install apache2-utils -y && \
  htpasswd -b -c /etc/nginx/.htpasswd admin password
# RUN chown nginx:nginx /etc/nginx/.htpasswd
