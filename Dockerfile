FROM node:18-alpine
WORKDIR /app
COPY ./*.json /app/
RUN npm install --force
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
