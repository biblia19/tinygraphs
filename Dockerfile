FROM golang:1.18-alpine AS Builder

RUN apk add --no-cache git build-base upx
RUN git clone -b master --single-branch https://github.com/taironas/tinygraphs.git /app

WORKDIR /app
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags="-s -w"; \
    upx --best --lzma /app/tinygraphs

FROM scratch

COPY --from=builder /app/app /app/
COPY --from=builder /app/tinygraphs /app/tinygraphs

ENV PORT=8080
EXPOSE 8080

CMD ["/app/tinygraphs"]
