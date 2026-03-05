# Використовуємо Node
FROM node:20-alpine

WORKDIR /app

# Копіюємо package.json та package-lock.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm ci

# Копіюємо весь код
COPY . .

# Build фронтенду
RUN npm run build

# Встановлюємо serve для продакшн-сервера
RUN npm install -g serve

# Cloud Run надає порт через $PORT
EXPOSE 8080

# Запуск через serve на динамічному порту
CMD ["sh", "-c", "serve -s dist -l $PORT"]