#!/usr/bin/env python3
"""
Скрипт для обновления страницы telegram.qmd
Добавляет новые материалы из пересылаемых сообщений
"""

import re
from datetime import datetime
import os

def update_telegram_page(new_materials):
    """
    Обновляет страницу telegram.qmd с новыми материалами
    
    Args:
        new_materials (list): Список новых материалов в формате
        [
            {
                'date': '15 июля 2024',
                'title': 'Название материала',
                'link': 'https://example.com',
                'description': 'Краткое описание'
            }
        ]
    """
    
    # Читаем текущий файл
    with open('telegram.qmd', 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Находим место для вставки (после "## Последние материалы")
    pattern = r'(## Последние материалы\n\n### 2024 год\n\n#### Июль 2024\n)'
    
    # Создаем новый контент для вставки
    new_content = "## Последние материалы\n\n### 2024 год\n\n#### Июль 2024\n"
    
    # Добавляем новые материалы
    for material in new_materials:
        new_content += f"\n**{material['date']}**\n"
        new_content += f"- **{material['title']}** - [{material['description']}]({material['link']})\n"
    
    # Заменяем старый контент
    updated_content = re.sub(pattern, new_content, content)
    
    # Записываем обновленный файл
    with open('telegram.qmd', 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    print("✅ Страница telegram.qmd обновлена!")

def add_material_from_telegram():
    """
    Интерактивная функция для добавления материала из Telegram
    """
    print("📱 Добавление материала из Telegram")
    print("=" * 40)
    
    date = input("📅 Дата (например: 15 июля 2024): ")
    title = input("📝 Название материала: ")
    link = input("🔗 Ссылка: ")
    description = input("📄 Краткое описание: ")
    
    material = {
        'date': date,
        'title': title,
        'link': link,
        'description': description
    }
    
    # Обновляем страницу
    update_telegram_page([material])
    
    # Пересобираем сайт
    os.system('quarto render --to html')
    print("✅ Сайт пересобран!")

if __name__ == "__main__":
    print("🤖 Скрипт обновления страницы Telegram")
    print("=" * 40)
    
    choice = input("Выберите действие:\n1. Добавить материал вручную\n2. Выход\nВаш выбор: ")
    
    if choice == "1":
        add_material_from_telegram()
    else:
        print("👋 До свидания!") 