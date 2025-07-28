# 🎬 Руководство по медиафайлам

## Обзор

Этот документ описывает, как добавлять и использовать видео, аудио и другие медиафайлы в проекте SNK.

## 📁 Структура папок

```
SNK/
├── media/
│   ├── videos/      # Видео файлы
│   ├── audio/       # Аудио файлы  
│   ├── documents/   # PDF и документы
│   ├── images/      # Изображения
│   └── presentations/ # Презентации
```

## 🚀 Быстрый старт

### 1. Создание структуры папок

```bash
python3 add_media.py --create-structure
```

### 2. Добавление медиафайла

```bash
python3 add_media.py /path/to/your/file.mp4
```

### 3. Вставка в контент

Скопируйте сгенерированный HTML код и вставьте в `.qmd` файл.

## 📹 Видео файлы

### Поддерживаемые форматы

- **MP4** (рекомендуется)
- **AVI**
- **MOV**
- **MKV**

### Примеры использования

#### Локальное видео

```html
<video width="100%" controls>
  <source src="media/videos/lecture.mp4" type="video/mp4">
  Ваш браузер не поддерживает видео.
</video>
```

#### YouTube видео

```html
<iframe width="100%" height="315" 
        src="https://www.youtube.com/embed/VIDEO_ID" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
</iframe>
```

#### Vimeo видео

```html
<iframe src="https://player.vimeo.com/video/VIDEO_ID" 
        width="100%" height="315" 
        frameborder="0" 
        allow="autoplay; fullscreen; picture-in-picture" 
        allowfullscreen>
</iframe>
```

## 🎵 Аудио файлы

### Поддерживаемые форматы

- **MP3** (рекомендуется)
- **WAV**
- **OGG**
- **M4A**

### Пример использования

```html
<audio controls>
  <source src="media/audio/podcast.mp3" type="audio/mpeg">
  <source src="media/audio/podcast.ogg" type="audio/ogg">
  Ваш браузер не поддерживает аудио.
</audio>
```

## 📄 Документы

### PDF документы

#### Встроенный просмотр

```html
<iframe src="media/documents/presentation.pdf" 
        width="100%" height="600" 
        style="border: none;">
</iframe>
```

#### Ссылка для скачивания

```markdown
[Скачать презентацию](media/documents/presentation.pdf){target="_blank"}
```

## 🖼️ Изображения

### Обычное изображение

```markdown
![Описание изображения](media/images/diagram.jpg){width="50%"}
```

### Изображение с подписью

```markdown
::: {.figure}
![Описание изображения](media/images/diagram.jpg){width="100%"}

Подпись к изображению
:::
```

## 📊 Ограничения GitHub Pages

### Размеры файлов

- **Видео:** до 100 МБ (рекомендуется до 50 МБ)
- **Аудио:** до 25 МБ
- **Изображения:** до 10 МБ
- **PDF:** до 50 МБ

### Альтернативы для больших файлов

1. **YouTube** - для видео
2. **Google Drive** - для документов
3. **Dropbox** - для любых файлов
4. **GitHub Releases** - для больших файлов

## 🛠️ Автоматизация

### Скрипт add_media.py

```bash
# Создание структуры папок
python3 add_media.py --create-structure

# Добавление файла
python3 add_media.py lecture.mp4
python3 add_media.py presentation.pdf
python3 add_media.py image.jpg
```

### Автоматическая загрузка

```bash
# После добавления медиафайлов
./auto_deploy.sh
```

## 📋 Пошаговый процесс

### Шаг 1: Подготовка файла

1. Убедитесь, что файл в поддерживаемом формате
2. Проверьте размер файла
3. Оптимизируйте при необходимости

### Шаг 2: Добавление файла

```bash
# Создайте структуру папок (если еще не создана)
python3 add_media.py --create-structure

# Добавьте файл
python3 add_media.py /path/to/your/file.mp4
```

### Шаг 3: Вставка в контент

1. Скопируйте сгенерированный HTML код
2. Откройте нужный `.qmd` файл в RStudio
3. Вставьте код в нужное место
4. Сохраните файл

### Шаг 4: Загрузка на сайт

```bash
./auto_deploy.sh
```

### Шаг 5: Проверка

1. Перейдите на https://svtsar.github.io/SNK/
2. Найдите страницу с медиафайлом
3. Проверьте, что файл отображается правильно

## 🎯 Примеры использования

### Лекция с видео

```markdown
# Лекция по фармакокинетике

В этой лекции мы рассмотрим основные принципы фармакокинетики.

```{=html}
<video width="100%" controls>
  <source src="media/videos/pharmacokinetics.mp4" type="video/mp4">
  Видео недоступно.
</video>
```

**Длительность:** 45 минут  
**Тема:** Основы фармакокинетики
```

### Презентация с PDF

```markdown
# Презентация по клиническим исследованиям

```{=html}
<iframe src="media/documents/clinical_trials.pdf" 
        width="100%" height="600" 
        style="border: none;">
</iframe>
```

[Скачать презентацию](media/documents/clinical_trials.pdf){target="_blank"}
```

### Подкаст с аудио

```markdown
# Подкаст: Интервью с экспертом

```{=html}
<audio controls>
  <source src="media/audio/expert_interview.mp3" type="audio/mpeg">
  Аудио недоступно.
</audio>
```

**Гость:** Доктор Иванов  
**Тема:** Новые методы лечения
```

## 🔧 Устранение проблем

### Проблема: Файл не отображается

**Решение:**
1. Проверьте путь к файлу
2. Убедитесь, что файл добавлен в git
3. Проверьте размер файла
4. Убедитесь, что формат поддерживается

### Проблема: Видео не воспроизводится

**Решение:**
1. Проверьте формат файла (рекомендуется MP4)
2. Убедитесь, что кодек поддерживается браузером
3. Попробуйте конвертировать в другой формат

### Проблема: Большой размер файла

**Решение:**
1. Сожмите файл
2. Используйте внешний сервис (YouTube, Google Drive)
3. Разделите файл на части

## 📚 Дополнительные ресурсы

### Инструменты для оптимизации

- **FFmpeg** - конвертация и сжатие видео
- **ImageOptim** - оптимизация изображений
- **HandBrake** - сжатие видео
- **Audacity** - редактирование аудио

### Полезные команды

```bash
# Сжатие видео с помощью FFmpeg
ffmpeg -i input.mp4 -c:v libx264 -crf 23 output.mp4

# Оптимизация изображения
convert image.jpg -quality 85 optimized.jpg

# Проверка размера файла
ls -lh media/videos/lecture.mp4
```

---

**💡 Совет:** Всегда проверяйте медиафайлы локально перед загрузкой на сайт! 