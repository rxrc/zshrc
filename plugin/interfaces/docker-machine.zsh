dm-start () {
  docker-machine start $(basename $(pwd))
}

dm-stop () {
  docker-machine stop $(basename $(pwd))
}

dm-restart () {
  docker-machine restart $(basename $(pwd))
}

dm-env () {
  docker-machine env $(basename $(pwd))
}

dm-create () {
  docker-machine create \
    --driver virtualbox \
    --virtualbox-share-folder $(pwd):$(pwd) \
    $(basename $(pwd))
}

dm-rm () {
  docker-machine rm $(basename $(pwd))
}
