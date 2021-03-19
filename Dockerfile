
FROM node:10-slim AS build
RUN apt-get update || : && apt-get install python -y && apt-get install build-essential -y
WORKDIR /app

COPY package.json package-lock.json /app/
RUN npm install

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
COPY . /app/
ENTRYPOINT ["entrypoint.sh"]

FROM build AS test
ENV IS_DOCKER=true
ENV XVFB_DISPLAY=:99
ENV XVFB_ARGS="-screen 0 1280x1024x16 -dpi 72 -ac +extension RANDR"
ENV DISPLAY=${XVFB_DISPLAY}
RUN mkdir -p /usr/share/man/man1 && \
  apt-get update; apt-get -y install openjdk-8-jre-headless xvfb wget

ENV CHROME_VERSION=88.0.4324.96-1
RUN wget --no-verbose https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb && \
  dpkg -i google-chrome-stable_${CHROME_VERSION}_amd64.deb; apt-get -fy install

RUN rm -rf /var/lib/apt/lists/*

COPY --from=build /app /app