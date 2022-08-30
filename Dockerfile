FROM devopsfaith/krakend:latest

WORKDIR /etc/krakend

COPY . .

RUN  FC_ENABLE=1  \
     FC_SETTINGS="$PWD/settings" \
     FC_PARTIALS="$PWD/partials" \
     krakend check -t -d -c "$PWD/krakend.json"

## The linting needs the final krakend.json file
#RUN krakend check -c /tmp/krakend.json --lint
##

CMD [ "run", "-c", "/etc/krakend/krakend.json" ]
