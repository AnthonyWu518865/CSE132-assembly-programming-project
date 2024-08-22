
extern "C" {
  // Prototypes for functions you will write in C
  uint8_t slowDivisionAlgorithm8(uint8_t dividend, uint8_t divisor);
  uint16_t slowDivisionAlgorithm16(uint16_t dividend, uint16_t divisor);
  uint8_t slowModulusAlgorithm(uint8_t dividend, uint8_t divisor);
  uint16_t sumOdds(uint8_t min, uint8_t max);
  
  
  // Prototypes for functions you will write in assembly
  uint8_t slowDivisionUint8(uint8_t a, uint8_t b);
  bool greaterThanOrEqualUInt16(uint16_t a, uint16_t b);
  uint16_t slowDivisionUint16(uint16_t a, uint16_t b);
  uint16_t slowModulusUint8(uint8_t a, uint8_t b);
  uint16_t sumOddsUint8(uint8_t a, uint8_t b);
}

