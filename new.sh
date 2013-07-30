DATE=$(date +"%m-%d-%Y")

echo "---
layout: haiku
date: $DATE
---

" > src/documents/haikus/$DATE.md
nano src/documents/haikus/$DATE.md
git add src/documents/haikus/$DATE.md
