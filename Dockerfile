# Используем официальный Node.js образ как базовый
FROM node:20-alpine AS base

# Устанавливаем pnpm глобально
RUN corepack enable && corepack prepare pnpm@10.15.0 --activate

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы package.json и pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Этап установки зависимостей
FROM base AS deps

# Устанавливаем зависимости
RUN pnpm install --frozen-lockfile --prod=false

# Этап сборки
FROM base AS builder

# Копируем node_modules из этапа deps
COPY --from=deps /app/node_modules ./node_modules

# Копируем исходный код
COPY . .

# Собираем приложение
RUN pnpm run build:prod

# Устанавливаем только продакшен зависимости
RUN pnpm install --frozen-lockfile --prod --ignore-scripts

# Продакшен этап
FROM node:20-alpine AS runner

# Создаем пользователя для безопасности
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

WORKDIR /app

# Устанавливаем dumb-init для правильной обработки сигналов
RUN apk add --no-cache dumb-init

# Копируем собранное приложение и зависимости
COPY --from=builder --chown=nextjs:nodejs /app/dist ./dist
COPY --from=builder --chown=nextjs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nextjs:nodejs /app/package.json ./package.json

# Переключаемся на непривилегированного пользователя
USER nextjs

# Экспонируем порт
EXPOSE 3000

# Устанавливаем переменные окружения
ENV NODE_ENV=production
ENV PORT=3000

# Проверка здоровья контейнера
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node --version || exit 1

# Запускаем приложение через dumb-init
ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "dist/index.js"]
