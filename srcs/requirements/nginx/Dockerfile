FROM alpine:latest as base

RUN apk update &&\
	apk upgrade &&\
	apk add --no-cache\
	nginx

RUN mkdir -p /run/nginx

RUN rm /etc/nginx/http.d/default.conf

COPY --chown=nginx:nginx healthcheck.sh /tmp/healthcheck.sh

COPY --chown=nginx:nginx conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]

FROM base as blog-dev

COPY --chown=nginx:nginx conf/blog.conf /etc/nginx/http.d/blog.conf
