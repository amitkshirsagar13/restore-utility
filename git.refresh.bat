@echo off
echo        Pulling latest updates!!!
git stash push -m "backups"
git reset --hard
git lfs pull origin master
git pull origin master
git stash apply stash@{0}
echo        Pulled latest updates and restored Old Backups!!!