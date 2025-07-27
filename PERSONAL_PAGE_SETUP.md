# Настройка персональной страницы www.svtsar.github.io

## Шаги для создания персональной страницы

### 1. Создание репозитория
1. Перейдите на GitHub и создайте новый репозиторий с именем `svtsar.github.io`
2. Это должно быть точное имя (ваш_username.github.io)

### 2. Клонирование и настройка
```bash
# Клонируйте новый репозиторий
git clone https://github.com/svtsar/svtsar.github.io.git
cd svtsar.github.io

# Скопируйте файлы резюме
cp ../SNK/cv.qmd index.qmd
cp ../SNK/styles.css .
cp ../SNK/cover.png .
```

### 3. Создание _quarto.yml
Создайте файл `_quarto.yml` со следующим содержимым:

```yaml
project:
  type: website

lang: ru

format:
  html:
    theme: cosmo
    toc: false
    number-sections: false
    css: styles.css
    self-contained: true

author:
  - name:
      given: Сергей
      family: Царегородцев
      literal: С.В. Царегородцев
    orcid: 0000-0002-0254-0516
    email: sergiotsar@ya.ru
```

### 4. GitHub Actions для автоматического деплоя
Создайте файл `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Quarto
      uses: quarto-dev/quarto-actions/setup@v2
      with:
        version: latest
        
    - name: Install dependencies
      run: |
        quarto install tinytex
        
    - name: Render
      run: quarto render
      
    - name: Create .nojekyll file
      run: echo "# This file tells GitHub Pages not to use Jekyll processing" > _site/.nojekyll
      
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      if: github.ref == 'refs/heads/main'
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./_site
```

### 5. Настройка GitHub Pages
1. Перейдите в Settings → Pages
2. Source: Deploy from a branch
3. Branch: gh-pages
4. Folder: / (root)
5. Save

### 6. Загрузка файлов
```bash
git add .
git commit -m "Initial commit - personal page"
git push origin main
```

## Структура файлов для персональной страницы

```
svtsar.github.io/
├── _quarto.yml          # Конфигурация Quarto
├── index.qmd            # Главная страница с резюме
├── styles.css           # Кастомные стили
├── cover.png            # Фото профиля
├── .github/workflows/   # GitHub Actions
└── README.md           # Описание проекта
```

## Результат

После настройки ваша персональная страница будет доступна по адресу:
**https://svtsar.github.io**

Страница будет содержать:
- Профессиональное резюме
- Контактную информацию
- Ссылки на проекты
- Научные публикации
- Навыки и достижения

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