#!/bin/bash

# Автоматический скрипт деплоя для GitHub Pages
# Следует подходу из видео: https://www.youtube.com/watch?v=Hbixs7ACvvw

echo "🚀 Автоматический деплой SNK сайта"
echo "=================================="

# 1. Собираем проект из папки source (HTML и PDF)
echo "📦 Собираем проект..."
cd source
quarto render --to html
quarto render --to pdf
cd ..

# 2. Копируем все файлы из source/_book в docs
echo "📋 Копируем файлы в docs..."
cp -r source/_book/* docs/
cp source/_book/.nojekyll docs/

# 3. Создаем файл .nojekyll в корневой папке для GitHub Pages
echo "📄 Создаем .nojekyll в корневой папке..."
touch .nojekyll

# 4. Создаем файл перенаправления в корневой папке
echo "🔄 Создаем файл перенаправления..."
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="0; url=./docs/index.html">
    <title>Перенаправление на SNK</title>
</head>
<body>
    <p>Перенаправление на <a href="./docs/index.html">SNK сайт</a>...</p>
</body>
</html>
EOF

# 5. Проверяем, что index.html создался
if [ -f "docs/index.html" ]; then
    echo "✅ index.html создан успешно"
else
    echo "❌ Ошибка: index.html не найден"
    exit 1
fi

# 6. Проверяем, что PDF создался
if [ -f "docs/snk_page.pdf" ]; then
    echo "✅ PDF создан успешно"
else
    echo "⚠️  PDF не найден, но это не критично"
fi

# 7. Добавляем изменения в git
echo "📝 Добавляем изменения в git..."
git add .

# 8. Создаем коммит
echo "💾 Создаем коммит..."
git commit -m "Автоматический деплой: $(date '+%Y-%m-%d %H:%M')"

# 9. Загружаем в GitHub
echo "📤 Загружаем в GitHub..."
git push origin main

echo ""
echo "✅ Деплой завершен!"
echo "🌐 Сайт будет доступен через 2-5 минут:"
echo "   https://svtsar.github.io/SNK/"
echo ""
echo "📋 Проверьте статус:"
echo "   https://github.com/svtsar/SNK/actions" 