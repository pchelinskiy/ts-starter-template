# TypeScript Starter Template 🚀

Современный шаблон TypeScript проекта с настроенными инструментами разработки и CI/CD.

## 📦 Что включено

- **TypeScript 5.x** с строгой конфигурацией
- **pnpm** как пакетный менеджер
- **SWC** для быстрой сборки и трансформации
- **ESLint + Prettier** с настроенными правилами
- **Vitest** для тестирования с поддержкой TypeScript
- **Husky** с pre-commit и commit-msg хуками
- **Conventional Commits** через CommitLint
- **GitHub Actions** CI/CD pipeline

---

## 🚀 Быстрый старт

### Установка зависимостей

```bash
pnpm install
```

> Husky хуки активируются автоматически через `prepare` скрипт

### Запуск в режиме разработки

```bash
pnpm run dev
```

### Сборка для продакшена

```bash
pnpm run build:prod
```

### Запуск собранного приложения

```bash
pnpm run start
```

---

## 📋 Доступные скрипты

### 🔧 Разработка

| Команда              | Описание                          |
| -------------------- | --------------------------------- |
| `pnpm run dev`       | Запуск с hot reload через nodemon |
| `pnpm run start:dev` | Alias для `dev`                   |

### 🏗️ Сборка

| Команда                | Описание                      |
| ---------------------- | ----------------------------- |
| `pnpm run build`       | Быстрая сборка через SWC      |
| `pnpm run build:prod`  | Продакшен сборка с проверками |
| `pnpm run build:watch` | Сборка в режиме наблюдения    |

### ▶️ Запуск

| Команда               | Описание                     |
| --------------------- | ---------------------------- |
| `pnpm run start`      | Запуск собранного приложения |
| `pnpm run start:prod` | Запуск в продакшен режиме    |

### 🧹 Качество кода

| Команда                 | Описание                  |
| ----------------------- | ------------------------- |
| `pnpm run lint`         | Проверка ESLint           |
| `pnpm run lint:fix`     | Автоисправление ESLint    |
| `pnpm run format`       | Форматирование Prettier   |
| `pnpm run format:check` | Проверка форматирования   |
| `pnpm run typecheck`    | Проверка типов TypeScript |

### 🧪 Тестирование

| Команда               | Описание                  |
| --------------------- | ------------------------- |
| `pnpm run test`       | Запуск всех тестов        |
| `pnpm run test:watch` | Тесты в режиме наблюдения |
| `pnpm run test:cov`   | Тесты с покрытием кода    |
| `pnpm run test:ci`    | Тесты для CI окружения    |

### 🔄 Утилиты

| Команда          | Описание                                  |
| ---------------- | ----------------------------------------- |
| `pnpm run clean` | Очистка dist и coverage                   |
| `pnpm run ci`    | Полная проверка (typecheck + lint + test) |

---

## 🔧 Настройка среды разработки

### Git настройки (для Windows)

Для корректной работы с переносами строк на Windows:

```bash
git config --global core.autocrlf false
git config --global core.eol lf
```

### VS Code настройки

Создайте `.vscode/settings.json`:

```json
{
  "files.eol": "\n",
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  },
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

---

## 📝 Conventional Commits

Используйте стандарт Conventional Commits для сообщений коммитов:

```
feat: добавить новую функцию
fix: исправить баг
docs: обновить документацию
style: изменения в форматировании
refactor: рефакторинг кода
test: добавить тесты
chore: обновить зависимости
```

**Примеры:**

- `feat: add user authentication`
- `fix: resolve memory leak in data processing`
- `docs: update API documentation`

---

## 🔄 CI/CD Pipeline

GitHub Actions автоматически запускает:

### На каждый Push/PR:

- ✅ Проверка качества кода (ESLint, Prettier)
- ✅ Проверка типов TypeScript
- ✅ Запуск тестов на Node.js 18, 20, 22
- ✅ Проверка безопасности зависимостей
- ✅ Сборка проекта

### Дополнительные проверки:

- 🔍 Проверка устаревших пакетов
- 🛡️ Сканирование безопасности (Trivy)
- 🔄 Проверка циклических зависимостей

---

## 📁 Структура проекта

```
├── src/                    # Исходный код
│   ├── index.ts           # Точка входа
│   └── test/              # Утилиты для тестов
├── dist/                  # Собранные файлы (gitignore)
├── coverage/              # Отчеты покрытия (gitignore)
├── .github/               # GitHub Actions
├── .husky/                # Git хуки
├── eslint.config.mjs      # Конфигурация ESLint
├── .prettierrc           # Конфигурация Prettier
├── tsconfig.json         # Конфигурация TypeScript
├── .swcrc                # Конфигурация SWC
├── nodemon.json          # Конфигурация Nodemon
└── jest.config.js        # Конфигурация Jest
```

---

## 🛠️ Кастомизация

### Добавление зависимостей

```bash
# Рантайм зависимости
pnpm add package-name

# Dev зависимости
pnpm add -D package-name
```

### Настройка линтера

Отредактируйте `eslint.config.mjs` для изменения правил ESLint.

### Настройка форматирования

Отредактируйте `.prettierrc` для изменения правил Prettier.

### Настройка TypeScript

Отредактируйте `tsconfig.json` для изменения настроек компиляции.

---

## 🚀 Деплой

Примеры деплоя для различных платформ:

- **Vercel**: `vercel --prod`
- **Netlify**: подключите GitHub репозиторий
- **VPS**: используйте PM2 для управления процессами
- **Docker**: используйте включенный Dockerfile

---

## 📄 Лицензия

UNLICENSED - частный проект

---

## 🤝 Вклад в проект

1. Создайте feature branch: `git checkout -b feature/amazing-feature`
2. Коммитьте изменения: `git commit -m 'feat: add amazing feature'`
3. Отправьте в branch: `git push origin feature/amazing-feature`
4. Откройте Pull Request

---

**Счастливого кодинга! 🎉**
