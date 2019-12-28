# Build phase 
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase - 'FOM terminates previous block'
FROM nginx
# copy from build to nginx host directory
COPY --from=builder /app/build /usr/share/nginx/html