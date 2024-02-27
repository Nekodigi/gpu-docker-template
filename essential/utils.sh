sync() {
    #do things with parameters like $1 such as
    git add .
    git commit -m $1
    git push origin HEAD
}

syncPull() {
    #do things with parameters like $1 such as
    git reset --hard origin/HEAD
    git pull
}
