#!/usr/bin/env python3
"""
Скрипт для добавления медиафайлов в проект SNK
"""

import os
import shutil
import sys
from pathlib import Path

def create_media_structure():
    """Создает структуру папок для медиафайлов"""
    media_dirs = [
        'media/videos',
        'media/audio', 
        'media/documents',
        'media/images',
        'media/presentations'
    ]
    
    for dir_path in media_dirs:
        Path(dir_path).mkdir(parents=True, exist_ok=True)
        print(f"✅ Создана папка: {dir_path}")

def add_media_file(file_path, media_type='videos'):
    """Добавляет медиафайл в соответствующую папку"""
    if not os.path.exists(file_path):
        print(f"❌ Файл не найден: {file_path}")
        return False
    
    # Определяем тип файла по расширению
    ext = Path(file_path).suffix.lower()
    if ext in ['.mp4', '.avi', '.mov', '.mkv']:
        target_dir = 'media/videos'
    elif ext in ['.mp3', '.wav', '.ogg', '.m4a']:
        target_dir = 'media/audio'
    elif ext in ['.pdf', '.doc', '.docx']:
        target_dir = 'media/documents'
    elif ext in ['.jpg', '.jpeg', '.png', '.gif', '.svg']:
        target_dir = 'media/images'
    elif ext in ['.ppt', '.pptx']:
        target_dir = 'media/presentations'
    else:
        target_dir = f'media/{media_type}'
    
    # Создаем папку если не существует
    Path(target_dir).mkdir(parents=True, exist_ok=True)
    
    # Копируем файл
    filename = Path(file_path).name
    target_path = os.path.join(target_dir, filename)
    
    try:
        shutil.copy2(file_path, target_path)
        print(f"✅ Файл добавлен: {target_path}")
        return target_path
    except Exception as e:
        print(f"❌ Ошибка при копировании: {e}")
        return False

def generate_html_code(file_path, media_type='video'):
    """Генерирует HTML код для вставки медиафайла"""
    filename = Path(file_path).name
    ext = Path(file_path).suffix.lower()
    
    if media_type == 'video' or ext in ['.mp4', '.avi', '.mov', '.mkv']:
        return f'''```{{=html}}
<video width="100%" controls>
  <source src="{file_path}" type="video/{ext[1:]}">
  Ваш браузер не поддерживает видео.
</video>
```'''
    
    elif media_type == 'audio' or ext in ['.mp3', '.wav', '.ogg', '.m4a']:
        return f'''```{{=html}}
<audio controls>
  <source src="{file_path}" type="audio/{ext[1:]}">
  Ваш браузер не поддерживает аудио.
</audio>
```'''
    
    elif ext == '.pdf':
        return f'''```{{=html}}
<iframe src="{file_path}" 
        width="100%" height="600" 
        style="border: none;">
</iframe>
```'''
    
    elif ext in ['.jpg', '.jpeg', '.png', '.gif']:
        return f'''![Описание изображения]({file_path}){{width="100%"}}'''
    
    else:
        return f'''[Скачать файл]({file_path}){{target="_blank"}}'''

def main():
    print("🎬 Добавление медиафайлов в проект SNK")
    print("=" * 50)
    
    if len(sys.argv) < 2:
        print("Использование:")
        print("  python3 add_media.py <путь_к_файлу>")
        print("  python3 add_media.py --create-structure")
        print("\nПримеры:")
        print("  python3 add_media.py lecture.mp4")
        print("  python3 add_media.py presentation.pdf")
        print("  python3 add_media.py image.jpg")
        return
    
    if sys.argv[1] == '--create-structure':
        create_media_structure()
        return
    
    file_path = sys.argv[1]
    
    if not os.path.exists(file_path):
        print(f"❌ Файл не найден: {file_path}")
        return
    
    # Добавляем файл
    target_path = add_media_file(file_path)
    if not target_path:
        return
    
    # Генерируем HTML код
    html_code = generate_html_code(target_path)
    
    print("\n📋 HTML код для вставки:")
    print("-" * 30)
    print(html_code)
    print("-" * 30)
    
    print("\n📝 Инструкции:")
    print("1. Скопируйте HTML код выше")
    print("2. Вставьте в нужный .qmd файл")
    print("3. Запустите: ./auto_deploy.sh")
    print("4. Проверьте на сайте")

if __name__ == "__main__":
    main() 