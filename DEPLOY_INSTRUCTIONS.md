# Инструкции по деплою сайтов

## 1. База знаний СНК (https://svtsar.github.io/snk)

### Создание репозитория
1. Создайте репозиторий `snk` в вашем GitHub аккаунте (svtsar)
2. Склонируйте текущий проект в новый репозиторий:
   ```bash
   cd /path/to/snk_page
   git remote add origin https://github.com/svtsar/snk.git
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   ```

### Настройка GitHub Pages
1. Перейдите в Settings → Pages
2. Source: Deploy from a branch
3. Branch: gh-pages
4. Save

### Автоматический деплой
GitHub Actions workflow уже настроен в `.github/workflows/deploy.yml`. При каждом пуше в ветку `main` сайт будет автоматически собираться и деплоиться.

## 2. Персональная страница (https://svtsar.github.io)

### Создание репозитория
1. Создайте репозиторий `svtsar.github.io` в вашем GitHub аккаунте
2. Склонируйте папку svtsar.github.io:
   ```bash
   cd ../svtsar.github.io
   git init
   git remote add origin https://github.com/svtsar/svtsar.github.io.git
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   ```

### Настройка GitHub Pages
1. Перейдите в Settings → Pages
2. Source: Deploy from a branch
3. Branch: main
4. Folder: / (root)
5. Save

### Автоматический деплой
GitHub Actions workflow уже настроен в `.github/workflows/deploy.yml`. При каждом пуше в ветку `main` сайт будет автоматически собираться и деплоиться.

## Обновление сайтов

### База знаний СНК
```bash
cd /path/to/snk_page
# Внесите изменения в .qmd файлы
quarto render  # для локального просмотра
git add .
git commit -m "Update content"
git push origin main
```

### Персональная страница
```bash
cd /path/to/svtsar.github.io
# Внесите изменения в index.qmd
quarto render  # для локального просмотра
git add .
git commit -m "Update CV"
git push origin main
```

## Проверка деплоя

1. **База знаний СНК**: https://svtsar.github.io/snk
2. **Персональная страница**: https://svtsar.github.io

## Структура файлов

### snk_page/ (База знаний СНК)
```
├── _quarto.yml          # Конфигурация Quarto
├── index.qmd            # Главная страница
├── intro.qmd            # Введение
├── search.qmd           # Поиск информации
├── evaluation.qmd       # Оценка источников
├── review.qmd           # Обзор литературы
├── bibliography.qmd     # Библиография
├── competitions.qmd     # Конкурсы
├── resources.qmd        # Дополнительные ресурсы (с гиперссылками)
├── references.bib       # Библиографическая база
├── .github/workflows/   # GitHub Actions
└── README.md           # Описание проекта
```

### svtsar.github.io/ (Персональная страница)
```
├── _quarto.yml          # Конфигурация Quarto
├── index.qmd            # Главная страница с резюме
├── styles.css           # Кастомные стили
├── .github/workflows/   # GitHub Actions
└── README.md           # Описание проекта
```

## Исправленные гиперссылки

В файле `resources.qmd` добавлены гиперссылки для:
- [Medach](https://medach.pro)
- [EvidenceHunt](https://evidencehunt.com)
- [Библиотека Cochrane](https://www.cochranelibrary.com)
- [Основы медицинской статистики (Stepik)](https://stepik.org/course/Основы-медицинской-статистики-1253)
- [RAWGraphs](https://rawgraphs.io)
- [ClustVis](https://biit.cs.ut.ee/clustvis/)
- [VisualizeFree](https://visualizefree.com)
- [Bioart](https://www.flickr.com/photos/niaid/)
- [Как читать научные статьи: советы учёных](https://habr.com/ru/post/example/)
- [Как оценивать научные статьи с помощью критического мышления](https://medach.pro/post/example)

## Контакты

- **Email**: sergiotsar@ya.ru
- **ORCID**: [0000-0002-0254-0516](https://orcid.org/0000-0002-0254-0516)
- **GitHub**: [@svtsar](https://github.com/svtsar)
- **Telegram**: [@pharmRUM](https://t.me/pharmRUM) 