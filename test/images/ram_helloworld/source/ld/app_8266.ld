MEMORY {
  iram : org = 0x40108000, len = 0x2000
  dram : org = 0x3FFE8000, len = 0x100
}

ENTRY(ram_main)

SECTIONS {
  .text : ALIGN(4) {
    *(.literal)
    *(.text .text.*)
  } > iram

  .bss : ALIGN(4) {
     _bss_start = ABSOLUTE(.);
    *(.bss)
	_bss_end = ABSOLUTE(.);
  } > dram

  .data : ALIGN(4) {
    *(.data)
    *(.rodata .rodata.*)
  } > dram
}

INCLUDE "../../../../flasher_stub/ld/rom_8266.ld"

PROVIDE(SPIFlashModeConfig = 0x40004568);
PROVIDE(SPIParamCfg = 0x40004c2c);
