FROM nginx:1.17-alpine as build

RUN apk add --update wget

ARG HUGO_VERSION="0.70.0"

RUN if [[ "$TARGETARCH" = "amd64" ]]; then \
  wget --quiet -O hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"; else \
  wget --quiet -O hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-ARM64.tar.gz"; fi && \
  tar xzf hugo.tar.gz && \
  rm -r hugo.tar.gz && \
  mv hugo /usr/bin

COPY ./ /site
WORKDIR /site
RUN hugo --minify

FROM nginx:1.17-alpine

RUN sed -i 's/listen  .*/listen 8080;/g' /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /site/public /usr/share/nginx/html
