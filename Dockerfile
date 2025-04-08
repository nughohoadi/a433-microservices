# Menggunakan base image Node.js versi 14
FROM node:14.21.3-alpine3.17


# Menentukan working directory di dalam container
WORKDIR /app

# Menyalin seluruh source code ke dalam working directory di container
COPY . .

# Menentukan environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan aplikasi saat container dijalankan
CMD ["npm", "start"]
