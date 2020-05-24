FROM nginx:1.17-alpine

RUN sed -i 's/listen  .*/listen 8080;/g' /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
ADD public /usr/share/nginx/html
