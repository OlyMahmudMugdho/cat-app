FROM golang:1.25-alpine as builder

WORKDIR /app
COPY go.mod ./
RUN go mod tidy
COPY . .
RUN go build -o cat-app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/cat-app .
COPY --from=builder /app/index.html .
COPY --from=builder /app/style.css .
COPY --from=builder /app/script.js .
COPY --from=builder /app/images ./images
EXPOSE 8080
CMD ["./app/cat-app"]
