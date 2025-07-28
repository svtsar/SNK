#!/bin/bash

# Автоматический скрипт деплоя для GitHub Pages
# Следует подходу из видео: https://www.youtube.com/watch?v=Hbixs7ACvvw

echo "🚀 Автоматический деплой SNK сайта"
echo "=================================="

# 1. Собираем проект
echo "📦 Собираем проект..."
quarto render --to html

# 2. Копируем все файлы из _book в корень
echo "📋 Копируем файлы в корень..."
cp -r _book/* .
cp _book/.nojekyll .

# 3. Проверяем, что index.html создался
if [ -f "index.html" ]; then
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