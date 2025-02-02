#!/usr/bin/env bash
#shellcheck disable=SC1091

# this is an example file to BUILD raw file system
# export variable SUITE to set debootstrap suite name (default: hirsute)

################
# kali build notice
# for best results use kali-linux host for building
# or try running with docker file in build/kali/raw

source plugins/envsetup
source plugins/colors

export OVERRIDER_COMPRESSION_TYPE
export ENABLE_EXIT
export SUITE
export OVERRIDER_MIRROR
export INCLUDE_PACKAGES
export DISABLE_LOCAL_DEBOOTSTRAP
export ENABLE_USER_SETUP
# export FS_USER
# export FS_PASS

SUITE="kali-rolling"
# FS_USER="kali"
# FS_PASS="kali" # no need to sepecify FS_UID & FS_GID cause default is 1001
OVERRIDER_MIRROR="http://http.kali.org/kali"
frn="out/${SUITE}-raw"
INCLUDE_PACKAGES="sudo apt-utils"
OVERRIDER_COMPRESSION_TYPE="gzip"
ENABLE_EXIT=true
DISABLE_LOCAL_DEBOOTSTRAP=true
ENABLE_USER_SETUP=false

warn "for best results use kali-linux host for building"

do_debootstrap "${frn}-arm64" arm64
do_compress    "${frn}-arm64"
do_debootstrap "${frn}-armhf" armhf
do_compress    "${frn}-armhf"
do_debootstrap "${frn}-amd64" amd64
do_compress    "${frn}-amd64"
