FROM strapi/base:14
WORKDIR /opt/so
COPY . .
RUN npm install
RUN npm run build
EXPOSE 6540
CMD ["npm", "run", "start"] 