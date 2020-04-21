# syntax=docker/dockerfile:experimental

FROM python:3.8-alpine3.11 as builder
RUN apk --no-cache add git
RUN pip wheel git+https://github.com/d0u9/youtube-dl-webui.git -w /tmp/wheel
RUN ls -al  /tmp/wheel

FROM python:3.8-alpine3.11
RUN apk add --no-cache su-exec
RUN --mount=from=builder,src=/tmp/wheel,target=/tmp/wheels pip install youtube-dl-webui==rolling -f /tmp/wheels
ADD config.json /config.json
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["youtube-dl-webui"]
