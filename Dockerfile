# STAGE 1: Build the binary
FROM golang:1.25-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy dependency files first to leverage Docker layer caching
COPY go.mod ./
# COPY go.sum ./ 

RUN go mod download

# Copy all source code and assets
COPY . .

# Build a statically linked binary named cat-app
RUN CGO_ENABLED=0 GOOS=linux go build -o cat-app main.go

# STAGE 2: Final lightweight runtime
FROM alpine:3.19

# Add certificates for secure networking (best practice)
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from the builder
COPY --from=builder /app/cat-app .

# Copy static frontend files and the images directory
COPY --from=builder /app/index.html .
COPY --from=builder /app/style.css .
COPY --from=builder /app/script.js .
COPY --from=builder /app/images ./images

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["./cat-app"]
