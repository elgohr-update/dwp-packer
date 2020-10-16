FROM hashicorp/packer:light as packer

FROM dwpdigital/awscli:0.0.8
COPY --from=packer /bin/packer /bin/packer

RUN apk add openssh-client

ENTRYPOINT [ "/bin/packer" ]
