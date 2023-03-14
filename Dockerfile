FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.18-alpine AS Builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache git build-base upx
RUN git clone -b master --single-branch https://github.com/taironas/tinygraphs.git /app

WORKDIR /app
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -a -ldflags="-s -w"; \
    upx --best --lzma /app/tinygraphs

FROM --platform=${TARGETPLATFORM:-linux/amd64} scratch

COPY --from=builder /app/app /app/
COPY --from=builder /app/tinygraphs /app/tinygraphs

ENV PORT=8080
EXPOSE 8080

CMD ["/app/tinygraphs"]
