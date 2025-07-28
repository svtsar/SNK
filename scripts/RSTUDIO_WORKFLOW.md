# 🎯 Рабочий процесс с RStudio и GitHub

## Обзор

Этот документ описывает, как эффективно работать с проектом в RStudio и автоматически синхронизировать изменения с GitHub.

## 🚀 Быстрый старт

### 1. Открытие проекта в RStudio

```bash
# В терминале RStudio
cd /path/to/SNK
```

Или через RStudio:
- **File → Open Project**
- Выберите файл `snk_page.Rproj`

### 2. Редактирование файлов

- **`.qmd` файлы** - редактируйте в RStudio
- **`_quarto.yml`** - конфигурация проекта
- **`telegram.qmd`** - страница для материалов из Telegram

### 3. Автоматическая загрузка

После редактирования запустите:
```bash
./deploy.sh
```

## 📋 Подробный рабочий процесс

### Шаг 1: Редактирование в RStudio

1. **Откройте файл** для редактирования (например, `index.qmd`)
2. **Внесите изменения** в RStudio
3. **Сохраните файл** (Ctrl+S / Cmd+S)

### Шаг 2: Предварительный просмотр

```bash
# Локальный просмотр сайта
quarto preview
```

Это откроет сайт в браузере для предварительного просмотра.

### Шаг 3: Загрузка в GitHub

```bash
# Автоматическая загрузка
./auto_deploy.sh
```

Скрипт автоматически:
- ✅ Соберет проект с помощью Quarto
- ✅ Скопирует все файлы в корень (как в видео)
- ✅ Добавит файлы в git
- ✅ Создаст коммит
- ✅ Загрузит в GitHub

### Шаг 4: Проверка деплоя

1. **Перейдите на GitHub:** https://github.com/svtsar/SNK
2. **Проверьте Actions** - должен быть запущен workflow
3. **Дождитесь завершения** (обычно 2-5 минут)
4. **Проверьте сайт:** https://svtsar.github.io/SNK/

## 🔧 Настройка RStudio

### Рекомендуемые настройки

1. **Включите автосохранение:**
   - **Tools → Global Options → General**
   - Поставьте галочку "Save workspace to .RData on exit"

2. **Настройте Git в RStudio:**
   - **Tools → Global Options → Git/SVN**
   - Укажите путь к Git

3. **Установите полезные пакеты:**
   ```r
   install.packages(c("usethis", "devtools", "roxygen2"))
   ```

### Полезные горячие клавиши

- **Ctrl+S / Cmd+S** - Сохранить файл
- **Ctrl+Shift+K / Cmd+Shift+K** - Knit документ
- **Ctrl+Shift+R / Cmd+Shift+R** - Запустить код
- **Ctrl+Enter / Cmd+Enter** - Выполнить строку

## 📁 Структура файлов для редактирования

### Основные файлы
```
SNK/
├── index.qmd              # Главная страница
├── intro.qmd              # Введение
├── search.qmd             # Поиск информации
├── evaluation.qmd         # Оценка источников
├── review.qmd             # Обзор литературы
├── bibliography.qmd       # Библиография
├── competitions.qmd       # Конкурсы
├── resources.qmd          # Ресурсы
├── telegram.qmd           # Материалы из Telegram
├── _quarto.yml            # Конфигурация
└── references.bib         # Библиография
```

### Файлы для автоматизации
```
SNK/
├── auto_deploy.sh         # Автоматическая загрузка
├── update_telegram.py     # Обновление Telegram
└── .github/workflows/     # GitHub Actions
```

## 🎯 Частые задачи

### Добавление нового раздела

1. **Создайте новый `.qmd` файл**
2. **Добавьте в `_quarto.yml`:**
   ```yaml
   chapters:
     - index.qmd
     - new_section.qmd  # Добавьте здесь
   ```
3. **Запустите `./auto_deploy.sh`**

### Обновление материалов из Telegram

1. **Запустите скрипт:**
   ```bash
   python3 update_telegram.py
   ```
2. **Следуйте инструкциям**
3. **Запустите `./auto_deploy.sh`**

### Изменение дизайна

1. **Отредактируйте `_quarto.yml`**
2. **Измените тему или стили**
3. **Запустите `./auto_deploy.sh`**

## 🔍 Отладка проблем

### Проблема: Сайт не обновляется

**Решение:**
1. Проверьте GitHub Actions: https://github.com/svtsar/SNK/actions
2. Убедитесь, что workflow завершился успешно
3. Подождите 5-10 минут (кэширование)

### Проблема: Ошибки в сборке

**Решение:**
1. Проверьте синтаксис YAML в `_quarto.yml`
2. Убедитесь, что все файлы сохранены
3. Проверьте логи GitHub Actions

### Проблема: Git не работает

**Решение:**
```bash
# Проверьте статус
git status

# Сбросьте изменения (если нужно)
git reset --hard HEAD

# Проверьте подключение к GitHub
git remote -v
```

## 📊 Мониторинг

### GitHub Actions
- **URL:** https://github.com/svtsar/SNK/actions
- **Проверяйте** статус деплоя
- **Логи** покажут ошибки, если есть

### Сайт
- **URL:** https://svtsar.github.io/SNK/
- **Проверяйте** обновления после деплоя

## 🚀 Продвинутые возможности

### Автоматический деплой при сохранении

Можно настроить автоматический деплой при каждом сохранении файла:

1. **Создайте watch скрипт:**
   ```bash
   # watch_changes.sh
   fswatch -o . | xargs -n1 ./auto_deploy.sh
   ```

2. **Запустите в фоне:**
   ```bash
   nohup ./watch_changes.sh &
   ```

### Локальная разработка

```bash
# Запуск локального сервера
quarto preview

# Сборка для продакшена
quarto render --to html

# Проверка синтаксиса
quarto check
```

## 📞 Поддержка

- **Email:** sergiotsar@ya.ru
- **Telegram:** @pharmRUM
- **GitHub Issues:** https://github.com/svtsar/SNK/issues

---

**Удачной работы с RStudio! 🎉** 