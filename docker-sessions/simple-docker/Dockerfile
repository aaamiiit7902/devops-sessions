FROM node:20-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY app.js ./
USER node
EXPOSE 3000
CMD ["node","app.js"]