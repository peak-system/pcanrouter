# Documentation and Scripts to build PCAN Router software with Linux

## download_pcan_source.sh

Script to download the PCAN router source code for development purposes

The PCAN router source code is extracted from the "Development package
for ARM-based products" from the PEAK download site.

As only the source code of the different PCAN router hardware is needed
the unused non-Linux stuff is omitted in the unzip process and the PCAN
router code for the different hardware types is provided in the `hw`
directory.

## download_hex2bin109_source.sh

Script to download and build the hex2bin tool needed for bin file creation

Download and build the hex2bin tool from its original download site.
The Hex2bin Version 1.0.9 is also needed in the original "Development
package for ARM-based products" from the PEAK download site as this
version is limited to 16MB address space analogue to the pcanflash
protocol.

## needed cross compile packages for (Debian/Ubuntu) Linux

Install these packages with `apt install <package>`.

(The install process requires root credentials so it may be `sudo apt install <package>`)

- gcc-arm-none-eabi
- binutils-arm-none-eabi
- libnewlib-arm-none-eabi
- libstdc++-arm-none-eabi-newlib
- libstdc++-arm-none-eabi-dev
- libnewlib-dev

## compile PCAN router source code example

- `cd hw/PCAN-Router/Examples/01_ROUTING/`
- `make`

The make process should have built a flash file `out/example_can.bin` which can be flashed with the `pcanflash` tool from https://github.com/peak-system/pcanflash (Linux) or with the PEAK-Flash tool from the PEAK Website (Win).
