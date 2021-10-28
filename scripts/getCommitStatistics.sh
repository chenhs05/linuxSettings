#reference: https://stackoverflow.com/a/48329147
git log --date=format-local:'%Y-%m-%d' --pretty=format:%ad | sort | uniq -c
