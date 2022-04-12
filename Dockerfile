FROM strapi/base:14
WORKDIR /opt/so
COPY . .
RUN npm install
RUN npm run build
EXPOSE 1337
CMD ["npm", "run", "start"] 