FROM alpine:latest

RUN apk update && apk add nginx bash ca-certificates curl

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443 8089 9000

STOPSIGNAL SIGQUIT

# CMD ["nginx", "-g", "daemon off;"]
CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
