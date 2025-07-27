# База знаний СНК кафедры фармакологии

Электронный учебник по научной работе для студентов-медиков, созданный с помощью Quarto.

## О проекте

Этот проект представляет собой базу знаний для научного кружка кафедры фармакологии Российского университета медицины. Сайт содержит материалы по:

- Поиску научной информации
- Критической оценке источников
- Оформлению библиографии
- Участию в научных конкурсах
- Дополнительным ресурсам для исследователей

## Технологии

- [Quarto](https://quarto.org/) - система для создания технических и научных документов
- R Markdown
- GitHub Pages для хостинга

## Структура проекта

```
snk_page/
├── _quarto.yml          # Конфигурация Quarto
├── index.qmd            # Главная страница
├── intro.qmd            # Введение
├── search.qmd           # Поиск информации
├── evaluation.qmd       # Оценка источников
├── review.qmd           # Обзор литературы
├── bibliography.qmd     # Библиография
├── competitions.qmd     # Конкурсы
├── resources.qmd        # Дополнительные ресурсы
├── references.bib       # Библиографическая база
└── _book/              # Сгенерированный сайт
```

## Локальная разработка

1. Установите [Quarto](https://quarto.org/docs/get-started/)
2. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/svtsar/snk.git
   cd snk
   ```
3. Запустите локальный сервер:
   ```bash
   quarto preview
   ```

## Деплой на GitHub Pages

### Автоматический деплой (рекомендуется)

1. Создайте репозиторий `snk` в вашем GitHub аккаунте
2. Настройте GitHub Actions для автоматического деплоя:

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
      
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      if: github.ref == 'refs/heads/main'
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./_book
```

### Ручной деплой

1. Создайте репозиторий `snk` в GitHub
2. Добавьте удаленный репозиторий:
   ```bash
   git remote add origin https://github.com/svtsar/snk.git
   ```
3. Соберите сайт:
   ```bash
   quarto render
   ```
4. Переключитесь на ветку `gh-pages` и загрузите файлы:
   ```bash
   git checkout -b gh-pages
   git add _book/*
   git commit -m "Deploy to GitHub Pages"
   git push origin gh-pages
   ```
5. В настройках репозитория включите GitHub Pages и выберите ветку `gh-pages`

## Обновление сайта

После внесения изменений в файлы `.qmd`:

1. Сохраните изменения
2. Запустите `quarto render` для пересборки
3. Загрузите изменения в GitHub:
   ```bash
   git add .
   git commit -m "Update content"
   git push origin main
   ```

## Автор

**Сергей Царегородцев**
- Преподаватель фармакологии, Российский университет медицины
- Email: sergiotsar@ya.ru
- ORCID: [0000-0002-0254-0516](https://orcid.org/0000-0002-0254-0516)
- Telegram: [@pharmRUM](https://t.me/pharmRUM)

## Лицензия

Этот проект распространяется под лицензией MIT. См. файл `LICENSE` для подробностей. 