FROM golang:1.22 as base

WORKDIR /app

COPY go.mod .

RUN go mod download  # if any dependencies are added we need to enable it

COPY . .

RUN go build -o main .

## Final stage with Distroless Image

FROM gcr.io/distroless/base

COPY --from=base /app/main .

COPY --from=base /app/static ./static

EXPOSE 8080

CMD ["./main"]


