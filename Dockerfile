FROM alpine:3.3

ARG AWS_CLI_VERSION

RUN apk --no-cache add py-pip python \
  && pip install --upgrade pip awscli==${AWS_CLI_VERSION}

ENV KEY=,SECRET=,REGION=,BUCKET=,BUCKET_PATH=/,CRON_SCHEDULE="0 1 * * *",PARAMS=

VOLUME ["/data"]

ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
