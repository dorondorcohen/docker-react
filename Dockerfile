FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# that said we want to copy all the files from the builder image (on the top)
COPY --from=builder /app/build /usr/share/nginx/html 
