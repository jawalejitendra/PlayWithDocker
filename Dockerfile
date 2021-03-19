
FROM node:10-slim AS build
WORKDIR /app
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
COPY . /app/
ENTRYPOINT ["entrypoint.sh"]

FROM build AS test
COPY --from=build /app /app