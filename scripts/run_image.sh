#!/bin/bash
cd "$(dirname "$0")"

qemu-system-arm -M beaglexm -mtdblock ../bin/beagle-nand.bin -nographic
