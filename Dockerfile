FROM node:22-slim AS builder

WORKDIR /app

COPY package.json pnpm-lock.yml ./

RUN corepack enable && corepack prepare pnpm@latest --activate

RUN pnpm install

COPY . .

RUN pnpm run build:prod

FROM node:22-slim AS runtime

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@latest --activate

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --prod --frozen-lockfile

COPY --from=builder /app/dist ./dist

CMD ["pnpm", "run", "start:prod"]