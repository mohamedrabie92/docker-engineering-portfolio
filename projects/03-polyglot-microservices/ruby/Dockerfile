FROM ruby:3.3-alpine
WORKDIR /app
COPY server.rb .
USER 10001:10001
EXPOSE 8080
CMD ["ruby", "server.rb"]
