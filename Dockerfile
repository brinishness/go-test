FROM golang:alpine AS builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
ENV GO111MODULE=off
RUN go build -o hello .
FROM alpine
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]
