# TS Starter Template

Базовый шаблон TypeScript проекта с настроенными:

- Node.js + TypeScript
- pnpm пакетным менеджером
- ESLint + Prettier
- Husky pre-commit и commit-msg хуки
- GitHub Actions CI: lint, prettier, typecheck, тесты, проверка устаревших пакетов
- SWC для быстрого билда
- Jest для тестирования

---

## Установка

```shell
pnpm install
```
Скрипт prepare автоматически активирует Husky хуки.

## Скрипты
```shell
pnpm run start:dev	# Запуск dev-сборки через ts-node с watch
```
```shell
pnpm run build:dev	# Запуск dev-сборки через nodemon + ts-node
```
```shell
pnpm run build:prod	# Сборка проекта в dist с помощью SWC
```
```shell
pnpm run start:prod	# Запуск собранного продакшен-билда (dist/index.js)
```
```shell
pnpm run lint	# ESLint проверка
```
```shell
pnpm run prettier:check	# Проверка форматирования Prettier
```
```shell
pnpm run prettier:write	# Исправление форматирования Prettier
```
```shell
pnpm run typecheck	# Проверка типов TypeScript
```
```shell
pnpm run check-updates	# Проверка устаревших зависимостей через ncu
```
```shell
pnpm run test	# Запуск тестов (Jest), пропускает если тестов нет
```
```shell
pnpm run test:watch	# Watch режим тестов
```
```shell
pnpm run test:cov	# Сборка покрытия тестов
```
```shell
pnpm run test:debug	# Запуск тестов в debug режиме
```
```shell
pnpm run test:e2e	# E2E тесты с отдельным конфигом
```

## Настройка Husky и CommitLint
- Husky хуки активируются через prepare скрипт.
- Commit messages проверяются через @commitlint/config-conventional.
- Для корректной работы коммитов используйте формат Conventional Commits:
- Начать писать код в src/.
- Настроить свои тесты, если требуется.

## CI / GitHub Actions
При пуше или PR:
- Проверка устаревших зависимостей (pnpm outdated)
- ESLint
- Prettier
- TypeScript typecheck
- SWC сборка (build:prod)
- Тесты (Jest)
