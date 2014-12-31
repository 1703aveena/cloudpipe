FROM golang:1.4

RUN useradd pipe && \
  go get github.com/tools/godep && \
  chown -R pipe:pipe /go

# USER pipe

ADD ./Godeps /go/src/github.com/cloudpipe/cloudpipe/Godeps
WORKDIR /go/src/github.com/cloudpipe/cloudpipe/
RUN godep restore

ADD . /go/src/github.com/cloudpipe/cloudpipe/
RUN go install github.com/cloudpipe/cloudpipe

CMD ["/go/bin/frontdoor"]
