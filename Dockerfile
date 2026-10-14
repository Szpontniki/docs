FROM rust:1-slim-bookworm AS builder

RUN cargo install mdbook

WORKDIR /book
COPY . .

RUN mdbook build

FROM nginx:alpine AS runner

COPY --from=builder /book/book /usr/share/nginx/html

EXPOSE 80
