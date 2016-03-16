FROM ruby:2.3

RUN mkdir -p /app

RUN gem install sinatra

COPY server.rb /app/server.rb

EXPOSE 80

CMD [ "/app/server.rb", "-p", "80", "-o", "0.0.0.0" ]
