#!/bin/bash

# Скрипт для автоматической загрузки изменений в GitHub
# Используйте этот скрипт после редактирования файлов в RStudio

echo "🚀 Автоматическая загрузка изменений в GitHub"
echo "=============================================="

# Проверяем, есть ли изменения
if git diff --quiet && git diff --cached --quiet; then
    echo "❌ Нет изменений для загрузки"
    exit 0
fi

# Показываем статус
echo "📋 Статус изменений:"
git status --short

# Добавляем все изменения
echo "📦 Добавляем изменения..."
git add .

# Запрашиваем сообщение коммита
echo ""
echo "💬 Введите сообщение коммита (или нажмите Enter для автоматического):"
read commit_message

# Если сообщение не введено, создаем автоматическое
if [ -z "$commit_message" ]; then
    commit_message="Обновлен контент $(date '+%Y-%m-%d %H:%M')"
fi

# Создаем коммит
echo "💾 Создаем коммит: $commit_message"
git commit -m "$commit_message"

# Загружаем в GitHub
echo "📤 Загружаем в GitHub..."
git push origin main

echo ""
echo "✅ Изменения загружены в GitHub!"
echo "🌐 GitHub Actions автоматически соберет и задеплоит сайт"
echo "⏱️  Обычно это занимает 2-5 минут"
echo ""
echo "🔗 Сайт будет доступен по адресу:"
echo "   https://svtsar.github.io/SNK/" 