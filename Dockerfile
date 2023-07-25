FROM golang:1-bullseye AS builder
WORKDIR /work
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o app

FROM gcr.io/distroless/static-debian11 AS runtime
COPY --from=builder /work/app /usr/local/bin/app
ENTRYPOINT ["/usr/local/bin/app"]
EXPOSE 8000
