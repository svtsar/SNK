#!/bin/bash

# Автоматический скрипт деплоя для GitHub Pages
# Следует подходу из видео: https://www.youtube.com/watch?v=Hbixs7ACvvw

echo "🚀 Автоматический деплой SNK сайта"
echo "=================================="

# 1. Собираем проект из папки source
echo "📦 Собираем проект..."
cd source
quarto render --to html
cd ..

# 2. Копируем все файлы из source/_book в docs
echo "📋 Копируем файлы в docs..."
cp -r source/_book/* docs/
cp source/_book/.nojekyll docs/

# 3. Проверяем, что index.html создался
if [ -f "docs/index.html" ]; then
    echo "✅ index.html создан успешно"
else
    echo "❌ Ошибка: index.html не найден"
    exit 1
fi

# 4. Добавляем изменения в git
echo "📝 Добавляем изменения в git..."
git add .

# 5. Создаем коммит
echo "💾 Создаем коммит..."
git commit -m "Автоматический деплой: $(date '+%Y-%m-%d %H:%M')"

# 6. Загружаем в GitHub
echo "📤 Загружаем в GitHub..."
git push origin main

echo ""
echo "✅ Деплой завершен!"
echo "🌐 Сайт будет доступен через 2-5 минут:"
echo "   https://svtsar.github.io/SNK/"
echo ""
echo "📋 Проверьте статус:"
echo "   https://github.com/svtsar/SNK/actions" 