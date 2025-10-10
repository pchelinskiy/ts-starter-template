# ---------- Базовый слой ----------
FROM node:20-alpine AS base

# Включаем corepack и активируем pnpm
RUN corepack enable && corepack prepare pnpm@10.15.0 --activate

# Рабочая директория
WORKDIR /app

# Копируем файлы зависимостей
COPY package.json pnpm-lock.yaml ./

# ---------- Установка зависимостей ----------
FROM base AS deps

# Устанавливаем все зависимости (dev + prod)
RUN pnpm install --frozen-lockfile

# ---------- Сборка ----------
FROM base AS builder

# Копируем установленные зависимости
COPY --from=deps /app/node_modules ./node_modules

# Копируем исходники
COPY . .

# Собираем приложение
RUN pnpm run build:prod

# Удаляем dev-зависимости, оставляем только prod
RUN pnpm prune --prod --ignore-scripts && pnpm store prune

# ---------- Финальный (runtime) слой ----------
FROM node:20-alpine AS runner

# Создаём непривилегированного пользователя
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 app

WORKDIR /app

# Устанавливаем dumb-init для корректной обработки сигналов
RUN apk add --no-cache dumb-init

# Копируем собранное приложение и только прод-зависимости
COPY --from=builder --chown=app:nodejs /app/dist ./dist
COPY --from=builder --chown=app:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=app:nodejs /app/package.json ./package.json

# Переключаемся на непривилегированного пользователя
USER app

# Порт и окружение
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Точка входа
ENTRYPOINT ["dumb-init"]
CMD ["node", "dist/index.js"]
