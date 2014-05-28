#!/bin/bash
cd "$(dirname "$0")"

rm ../bin/beagle-nand.bin 2> /dev/null
./bb_nandflash.sh ../bin/x-load.bin.ift ../bin/beagle-nand.bin x-loader
./bb_nandflash.sh ../bin/u-boot.bin ../bin/beagle-nand.bin u-boot
./bb_nandflash.sh ../build/kernel.elf ../bin/beagle-nand.bin kernel
./bb_nandflash_ecc ../bin/beagle-nand.bin 0x0 0xe80000
