FROM alpine:3.6

ENV ALPINE_VERSION=3.6

# Install needed packages. Notes:
#   * nodejs: Node.js and NPM 
#   * mongodb: MongoDB to act as DB.
#   * Git: Git to store wiki-js documents
#   * Curl: Curl for downloads.

# Replace with your email address:
ENV WIKI_ADMIN_EMAIL charles@structa.co.uk


ENV PACKAGES="\
  nodejs \
  mongodb \
  git \
  curl \
"

RUN apk --update add --no-cache $PACKAGES  \
    && echo 


# Replace your-config.yml with the path to your config file:
ADD config-structa.yml /var/wiki/config.yml

EXPOSE 3000

# Entrypoint
ADD start.sh /
RUN chmod u+x /start.sh