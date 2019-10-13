FROM alpine:3.10 AS tmp

ADD docker /files

RUN chmod a+x /files/bin/*


FROM alpine:3.10

ENV GITHUB_REF="" \
    GITHUB_ACTOR="" \
    GITHUB_TOKEN="" \
    GITHUB_REPOSITORY=""

COPY --from=tmp /files /

RUN apk --no-cache add $(ls /var/lib/pkgs/alpine)

CMD ["sh", "/github-upload.sh"]
