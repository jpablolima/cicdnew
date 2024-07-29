FROM golang:alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

RUN git clone https://github.com/Lusitaniae/apache_exporter.git

WORKDIR /app/apache_exporter

RUN go build -o /bin/apache_exporter .

FROM alpine:latest

COPY --from=builder /bin/apache_exporter /bin/apache_exporter

EXPOSE 9117

ENTRYPOINT ["/bin/apache_exporter"]
