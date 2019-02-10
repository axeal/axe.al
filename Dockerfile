FROM nginx:1.14-alpine

COPY public/* /usr/share/nginx/html/
