FROM node:8.4.0

RUN apt install npm

WORKDIR /app/

COPY . /app/

CMD ["node", "index.js"]

EXPOSE 8080
