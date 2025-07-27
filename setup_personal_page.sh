#!/bin/bash

# Скрипт для настройки персональной страницы svtsar.github.io

echo "🚀 Настройка персональной страницы svtsar.github.io"
echo "=================================================="

# Проверяем, что мы в правильной директории
if [ ! -d "personal_page" ]; then
    echo "❌ Ошибка: папка personal_page не найдена"
    exit 1
fi

echo "📁 Создание репозитория svtsar.github.io..."

# Создаем временную директорию для нового репозитория
TEMP_DIR=$(mktemp -d)
echo "📂 Временная директория: $TEMP_DIR"

# Копируем файлы в временную директорию
echo "📋 Копирование файлов..."
cp -r personal_page/* "$TEMP_DIR/"

# Переходим в временную директорию
cd "$TEMP_DIR"

echo "✅ Файлы скопированы в $TEMP_DIR"
echo ""
echo "📋 Список файлов для загрузки:"
ls -la

echo ""
echo "🔧 Следующие шаги для завершения настройки:"
echo ""
echo "1. Создайте репозиторий 'svtsar.github.io' на GitHub:"
echo "   - Перейдите на https://github.com/new"
echo "   - Repository name: svtsar.github.io"
echo "   - Сделайте репозиторий публичным"
echo "   - НЕ инициализируйте с README"
echo ""
echo "2. Клонируйте репозиторий:"
echo "   git clone https://github.com/svtsar/svtsar.github.io.git"
echo ""
echo "3. Скопируйте файлы из временной директории:"
echo "   cp -r $TEMP_DIR/* svtsar.github.io/"
echo ""
echo "4. Перейдите в репозиторий и загрузите файлы:"
echo "   cd svtsar.github.io"
echo "   git add ."
echo "   git commit -m 'Initial commit - personal page'"
echo "   git push origin main"
echo ""
echo "5. Настройте GitHub Pages:"
echo "   - Перейдите в Settings → Pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: gh-pages"
echo "   - Folder: / (root)"
echo "   - Save"
echo ""
echo "6. Дождитесь завершения деплоя (обычно 2-5 минут)"
echo ""
echo "🎉 После этого ваша персональная страница будет доступна по адресу:"
echo "   https://svtsar.github.io"
echo ""
echo "📁 Временная директория с файлами: $TEMP_DIR"
echo "💡 Не удаляйте эту директорию до завершения настройки!" 