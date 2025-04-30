FROM nginx:1.25.2

RUN apt-get update
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app
COPY . .

RUN npm install

COPY ./osc-nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /app/osc-entrypoint.sh

ENV NODE_ENV=production
ENTRYPOINT ["/app/osc-entrypoint.sh"]
