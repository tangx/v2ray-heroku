FROM nginx:alpine

WORKDIR /app

ENV V2RAY_VERSION=v4.27.5
RUN wget -c https://github.com/v2ray/v2ray-core/releases/download/${V2RAY_VERSION}/v2ray-linux-64.zip && unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip

ADD ./conf.d/nginx.default.conf.tmpl ./nginx.default.conf.tmpl
ADD ./conf.d/v2ray.json.tmpl ./v2ray.json.tmpl

ADD ./bin/docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
