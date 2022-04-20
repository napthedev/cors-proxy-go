FROM golang:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN go build -o ./app .

EXPOSE 5000

ENTRYPOINT ["./app"]