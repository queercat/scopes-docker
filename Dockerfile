# stage 0 -- build scopes
# minified OS
from ubuntu:latest
run apt-get update

# install mercurial
run apt-get -y install mercurial

# deps
run apt-get -y install g++
run apt-get -y install make
run apt-get -y install cmake
run apt-get -y install xz-utils
run apt-get -y install libncurses5
run apt-get -y install libncurses5-dev
run apt-get -y install libz-dev

# get the repo
run hg clone https://hg.sr.ht/~duangle/scopes 
workdir scopes

run ./build.sh

from alpine:latest
# stage 1 -- pull out Scopes
workdir scopes

# copy from stage 0
copy --from=0 /scopes/bin /
copy --from=0 /scopes/lib /

run ln -s ./bin/scopes /bin/scopes
