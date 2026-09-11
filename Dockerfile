FROM golang:1.22 AS build
WORKDIR /src
COPY go.mod .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /out/archive-safety .

FROM gcr.io/distroless/static-debian12
WORKDIR /app
COPY --from=build /out/archive-safety /app/archive-safety
EXPOSE 8080
ENTRYPOINT ["/app/archive-safety"]
