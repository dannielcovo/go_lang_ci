FROM golang:alpine as multistage

ADD ./src/function_sum /go/src/function_sum

WORKDIR /go/src/function_sum

RUN go install -v \
    && go build

RUN CGO_ENABLED=0 GOOS=linux go install -a -installsuffix cgo -v

## turning minimal image
FROM scratch

COPY --from=multistage /go/bin/function_sum /go/bin/

CMD ["/go/bin/function_sum"]