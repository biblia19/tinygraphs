# FROM golang:1.18-alpine AS Builder
FROM golang:1.18-alpine

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    PORT=8080

RUN apk add --no-cache git build-base
RUN git clone -b master --single-branch https://github.com/taironas/tinygraphs.git /app

WORKDIR /app
RUN go get github.com/taironas/tinygraphs
RUN go build -a -ldflags="-s -w"

RUN apk del git build-base

# FROM golang:1.18-alpine

# COPY --from=builder /app/app /app/app
# COPY --from=builder /app/tinygraphs /app/tinygraphs

EXPOSE 8080

CMD ["/app/tinygraphs"]
