FROM golang:1.22

# Set working directory
WORKDIR /app

# Copy Go source code
COPY . .
RUN go mod tidy
RUN go build -o app ./cmd/main.go

ENV DATABASE_URI=mongodb://host.docker.internal:21569


# Expose app port (optional if your app listens on 3030)
EXPOSE 3030

# Run the app
CMD ["./app"]
