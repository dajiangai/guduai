FROM nginx:1.25

COPY build/web/ /data/webroot
COPY web/zhihuiguo.html /data/webroot
COPY nginx.conf /etc/nginx/conf.d/default.conf