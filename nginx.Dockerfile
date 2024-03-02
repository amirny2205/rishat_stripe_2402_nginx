FROM nginx:latest
COPY ./nginx.rishat.conf.template /etc/nginx/
RUN touch /etc/nginx/conf.d/rishat.conf
RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /home/nginx_user/rishat_nginx/django_static
CMD envsubst < /etc/nginx/nginx.rishat.conf.template > /etc/nginx/conf.d/rishat.conf; nginx -g 'daemon off;'