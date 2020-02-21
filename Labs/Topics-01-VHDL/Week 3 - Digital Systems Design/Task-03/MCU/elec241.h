#include "mbed.h"
#ifndef __ELEC241__
#define __ELEC241__

typedef enum {READBACK=0, LEDS_AND_SWITCHES, ILLEGAL}  INSTR;

uint16_t fpgaWord(INSTR u, uint16_t payload) {
	return ((uint16_t)u << 12) | (payload & 0x0FFF);
}
#endif
