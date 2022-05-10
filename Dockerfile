FROM strapi/base:14
EXPOSE 3005

WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN npm i
RUN npm run build

COPY . /app

CMD ["npm", "run", "develop"]
