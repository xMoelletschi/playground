FROM golang:1.24.0 as builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o main .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/main .
CMD ["./main"]
