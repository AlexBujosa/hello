# syntax=docker/dockerfile:1

FROM golang:1.18 as builder

RUN apt-get update

ENV GO111MODULE=on\
    CGO_ENABLED=0\
    GOOS=linux\
    GOARCH=amd64

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./
RUN go build -o /hello

EXPOSE 8080


CMD ["/hello"]
#CMD ["./main"]
# docker build -t myapp .
# dsudo s
