FROM docker.io/golang:latest

ARG DEBIAN_FRONTEND=noninteractive

VOLUME [ "/go/src/" ]

RUN apt-get update && \
    apt-get install -y libblkid-dev util-linux dosfstools e2fsprogs btrfs-progs xfsprogs gdisk coreutils mdadm vim && \
    apt-get clean

RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/idubinskiy/schematyper@latest
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install github.com/ramya-rao-a/go-outline@latest
RUN go install github.com/cweill/gotests/gotests@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
RUN GOBIN=/tmp/ go install github.com/go-delve/delve/cmd/dlv@latest
RUN mv /tmp/dlv /go/bin/dlv-dap

ENV PATH="/opt/gtk/bin:${PATH}"

