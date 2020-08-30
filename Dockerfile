FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build ---> is where the actual build files will be present
# run time container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html