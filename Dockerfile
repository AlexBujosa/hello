# syntax=docker/dockerfile:1

FROM golang:1.18 as builder

RUN apt-get update

ENV GO111MODULE=on\
    CGO_ENABLED=0\
    GOOS=linux\
    GOARCH=amd64

WORKDIR /Desktop/GO/Applications/goworkspace/src/github.com/AlexBujosa/hello

COPY go.mod .
RUN go mod download

COPY . . 
RUN go install

FROM scratch 
COPY --from=builder /Desktop/GO/Applications/goworkspace/src/github.com/AlexBujosa//hello .
ENTRYPOINT [ "./main" ]

#CMD ["./main"]
# docker build -t myapp .
# dsudo s
