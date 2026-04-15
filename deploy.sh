#!/bin/bash
set -e

cd "$(dirname "$0")"

MSG="${1:-Update}"
VER=$(date +%Y%m%d-%H%M%S)

/usr/bin/sed -i '' "s/const APP_VERSION = '[^']*'/const APP_VERSION = '$VER'/" index.html

if git diff --quiet index.html; then
  echo "index.html に変更がありません。終了します。"
  exit 0
fi

git add index.html
git commit -m "$MSG (v$VER)"
git push

echo ""
echo "✅ デプロイ完了: v$VER"
echo "🌐 https://41morinaga-glitch.github.io/eiken-words/"
echo "   (反映まで1〜2分 / 既に開いているアプリは自動リロードされます)"
