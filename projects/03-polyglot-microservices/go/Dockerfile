FROM golang:1.24-alpine AS build
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /service main.go
FROM scratch
COPY --from=build /service /service
USER 10001:10001
EXPOSE 8080
ENTRYPOINT ["/service"]
