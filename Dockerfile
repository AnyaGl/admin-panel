FROM strapi/base:14
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN db_dump.sql
EXPOSE 6540
CMD ["npm", "run", "start"] 