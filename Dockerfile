FROM golang:1.19-alpine

WORKDIR /www


# Download Go modules

WORKDIR /www/src

COPY ./src/ .

# COPY ./src/go.mod ./
# COPY ./src/go.mod ./
RUN go mod download

RUN go install github.com/cosmtrek/air@latest
# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy

# Build
ENV GO111MODULE=on
RUN go build -o /build
# This is for documentation purposes only.
# To actually open the port, runtime parameters
# must be supplied to the docker command.
EXPOSE 8080

# (Optional) environment variable that our dockerised
# application can make use of. The value of environment
# variables can also be set via parameters supplied
# to the docker command on the command line.
#ENV HTTP_PORT=8081

# Run
CMD ["air"]
