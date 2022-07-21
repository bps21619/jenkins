FROM node:8.4.0
RUN apt install nodejs

WORKDIR /app/

COPY . /app/

CMD ["node", "index.js"]

EXPOSE 8080
