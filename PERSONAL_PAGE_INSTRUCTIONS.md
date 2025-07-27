# 🚀 Пошаговая настройка персональной страницы svtsar.github.io

## Шаг 1: Создание репозитория на GitHub

1. Перейдите на https://github.com/new
2. Введите **Repository name**: `svtsar.github.io`
3. Выберите **Public**
4. **НЕ** ставьте галочку "Add a README file"
5. Нажмите **Create repository**

## Шаг 2: Клонирование репозитория

```bash
# Клонируйте репозиторий
git clone https://github.com/svtsar/svtsar.github.io.git

# Перейдите в директорию
cd svtsar.github.io
```

## Шаг 3: Копирование файлов

```bash
# Скопируйте все файлы из временной директории
cp -r /var/folders/8m/f98fqbbx2xj4wn1gxclsj6q00000gn/T/tmp.x4QbjV1Q5V/* .

# Проверьте, что файлы скопированы
ls -la
```

Вы должны увидеть:
- `_quarto.yml`
- `index.qmd`
- `styles.css`
- `cover.png`
- `README.md`
- `.github/workflows/deploy.yml`

## Шаг 4: Загрузка файлов в GitHub

```bash
# Добавьте все файлы
git add .

# Создайте коммит
git commit -m "Initial commit - personal page"

# Загрузите в GitHub
git push origin main
```

## Шаг 5: Настройка GitHub Pages

1. Перейдите в ваш репозиторий на GitHub
2. Нажмите **Settings** (вкладка)
3. В левом меню найдите **Pages**
4. В разделе **Source** выберите:
   - **Deploy from a branch**
   - **Branch**: `gh-pages`
   - **Folder**: `/ (root)`
5. Нажмите **Save**

## Шаг 6: Ожидание деплоя

GitHub Actions автоматически:
1. Соберет сайт с помощью Quarto
2. Создаст ветку `gh-pages`
3. Задеплоит сайт

Обычно это занимает 2-5 минут.

## Шаг 7: Проверка результата

После завершения деплоя ваша персональная страница будет доступна по адресу:
**https://svtsar.github.io**

## Структура файлов

```
svtsar.github.io/
├── _quarto.yml          # Конфигурация Quarto
├── index.qmd            # Главная страница с резюме
├── styles.css           # Кастомные стили
├── cover.png            # Фото профиля
├── .github/workflows/   # GitHub Actions
│   └── deploy.yml       # Автоматический деплой
└── README.md           # Описание проекта
```

## Возможные проблемы и решения

### Проблема: GitHub Pages не работает
**Решение:**
1. Проверьте, что репозиторий называется точно `svtsar.github.io`
2. Убедитесь, что репозиторий публичный
3. Проверьте настройки в Settings → Pages

### Проблема: Сайт не собирается
**Решение:**
1. Проверьте логи GitHub Actions
2. Убедитесь, что все файлы загружены
3. Проверьте синтаксис YAML файлов

### Проблема: Стили не применяются
**Решение:**
1. Проверьте, что файл `styles.css` загружен
2. Убедитесь, что в `_quarto.yml` указан правильный путь к CSS

## Обновление резюме

Для обновления резюме:
1. Отредактируйте `index.qmd`
2. Загрузите изменения:
```bash
git add .
git commit -m "Update CV"
git push origin main
```

GitHub Actions автоматически соберет и задеплоит обновленную версию.

## Контакты для поддержки

- **Email**: sergiotsar@ya.ru
- **Telegram**: @pharmRUM
- **GitHub**: @svtsar

---

**Удачи с настройкой персональной страницы! 🎉** 