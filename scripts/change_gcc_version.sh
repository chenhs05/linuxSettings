#!/usr/bin/env sh

# by default gcc will take the version with high priority

VER=6
PRIO=50
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VER \
                    $PRIO \
                    --slave   /usr/bin/g++ g++ /usr/bin/g++-$VER \
                    --slave   /usr/bin/gcov gcov /usr/bin/gcov-$VER \
                    --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-$VER \
                    --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-$VER \
                    --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-$VER \
                    --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-$VER \
                    --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-$VER \
                    --slave   /usr/bin/cpp cpp-bin /usr/bin/cpp-$VER \
                    --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-$VER

VER=7
PRIO=40
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VER \
                    $PRIO \
                    --slave   /usr/bin/g++ g++ /usr/bin/g++-$VER \
                    --slave   /usr/bin/gcov gcov /usr/bin/gcov-$VER \
                    --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-$VER \
                    --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-$VER \
                    --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-$VER \
                    --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-$VER \
                    --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-$VER \
                    --slave   /usr/bin/cpp cpp-bin /usr/bin/cpp-$VER \
                    --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-$VER
