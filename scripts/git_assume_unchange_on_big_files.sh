find . -size +1G | sed -e "/\.git/d" | git update-index --assume-unchanged
