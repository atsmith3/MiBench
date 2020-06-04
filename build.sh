#!/bin/bash
#
# Copyright (c) 2020 Andrew Smith
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

script_name="build.sh"

print_info () {
  green="\e[32m"
  nc="\e[0m"
  echo -e "$green[ $script_name ]$nc $1"
}

print_error () {
  red="\e[31m"
  nc="\e[0m"
  echo -e "$red[ $script_name ] Error:$nc $1"
}

if [ -z $1 ]; then
  TB="$PWD/testbin"
  IP="$PWD/testbin/input"
else
  TB="$PWD/$1"
  IP="$PWD/$1/input"
fi

if [ ! -d $TB ]; then
  print_info "creating testbin: $TB"
  mkdir -p $TB
fi

if [ ! -d $IP ]; then
  print_info "creating testbin/input: $IP"
  mkdir -p $IP
fi

GEM5=1

export GEM5_ROOT=$PWD

pushd automotive/basicmath 
  print_info "$PWD: building basicmath"
  make clean && make GEM5=$GEM5
  print_info "Copying basicmath_large to testbin"
  cp basicmath_large $TB/basicmath
popd

pushd automotive/bitcount 
  print_info "$PWD: building bitcnts"
  make clean && make GEM5=$GEM5
  print_info "Copying bitcnts to testbin"
  cp bitcnts $TB
popd

pushd automotive/qsort
  TN="qsort"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp qsort_large $TB/qsort
  cp input_large.dat $IP/qsort.dat
popd

pushd automotive/susan 
  TN="susan"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp susan $TB/susan
  cp input_large.pgm $IP/susan.pgm
popd

pushd network/dijkstra
  TN="dijkstra"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp dijkstra $TB/dijkstra
  cp dijkstra.dat $IP/dijkstra.dat
popd

pushd network/patricia
  TN="patricia"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp patricia $TB/patricia
  cp patricia.udp $IP/patricia.udp
popd

pushd security/blowfish
  TN="blowfish"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp bf $TB/blowfish
  cp blowfish_large.enc $IP/blowfish.enc
  cp blowfish_large.asc $IP/blowfish.asc
popd

pushd security/rijndael
  TN="rijndael"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp rijndael $TB/rijndael
  cp rijndael_large.enc $IP/rijndael.enc
  cp rijndael_large.asc $IP/rijndael.asc
popd

pushd security/sha
  TN="sha"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp sha $TB/sha
  cp sha_large.asc $IP/sha.asc
popd

pushd telecomm/CRC32
  TN="CRC32"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp crc $TB/crc
  cp crc_large.pcm $IP/crc.pcm
popd

pushd telecomm/FFT
  TN="FFT"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp fft $TB/fft
popd

pushd telecomm/gsm
  TN="gsm"
  print_info "$PWD: building $TN"
  make clean && make GEM5=$GEM5
  print_info "Copying $TN to testbin"
  cp bin/toast $TB/toast
  cp bin/untoast $TB/untoast
  cp data/large.au $IP/toast.au
  cp data/large.au.run.gsm $IP/untoast.au.run.gsm
popd
