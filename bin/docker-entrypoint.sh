#!/bin/bash

cd $(dirname $0)


export UUID=${UUID:-"016fc941-65bd-42e3-960a-fc5af670b74e"}

envsubst < ./nginx.default.conf.tmpl > /etc/nginx/conf.d/default.conf
envsubst < ./v2ray.json.tmpl > ./v2ray.json

nginx

exec ./v2ray -c ./v2ray.json
