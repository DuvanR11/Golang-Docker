FROM golang:latest AS builder

RUN go env -w GOPROXY=direct
RUN go env -w GO111MODULE=on
RUN apt-get install git
RUN apt-get install ca-certificates && update-ca-certificates
RUN mkdir -p /src

WORKDIR /src
ADD . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go

FROM alpine
WORKDIR /root
COPY --from=builder /src .
EXPOSE 8080
ENTRYPOINT [ "/root/app" ]