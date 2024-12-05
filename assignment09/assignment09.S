#include <avr/io.h>
#include "asmMacros.s"  // Include macros to print log messages or a single register
.text


.global slowDivisionUint8
slowDivisionUint8:
  // TODO: uint8_t slowDivisionUint8(uint8_t a, uint8_t b)
  push r25
  push r18
  ldi r25, 0
loop:   
    cp r24,r22
    brlo done
    sub r24, r22
    inc r25
    rjmp loop
done:
    mov r24,r25
    pop r18
    pop r25
    ret


.global greaterThanOrEqualUInt16
greaterThanOrEqualUInt16:
  // TODO: bool greaterThanOrEqualUInt16(uint16_t a, uint16_t b)
push r18
ldi r18, 0
cp r24, r22
cpc r25, r23
brcs case
ldi r18, 1

case: 
  mov r24, r18
  pop r18
  ret


.global slowDivisionUint16
slowDivisionUint16:
  // TODO: uint16_t slowDivisionUint16(uint16_t a, uint16_t b)
  push r16
  push r17
  push r18
  push r19
  push r30
  push r31
  push r20
  mov r18, r24
  mov r19, r25
  ldi r20, 1
  ldi r30, 0
  ldi r31, 0

loop16:
  call greaterThanOrEqualUInt16
  cp r24, r20
  brlo after16
  sub r18, r22
  sbc r19, r23
  add r30, r20
  adc r31, r1
  mov r25, r19
  mov r24, r18
  jmp loop16

after16:
  mov r25, r31
  mov r24, r30
  pop r20
  pop r31
  pop r30
  pop r19
  pop r18
  pop r17
  pop r16
  ret


.global slowModulusUint8
slowModulusUint8:
  // TODO: uint16_t slowModulusUint8(uint8_t a, uint8_t b)
  // Save caller-saved registers
    push r18
    push r19
    push r20
    push r21
    mov r18, r24
    mov r20, r22
    call slowDivisionUint8
    mul r24, r20
    movw r24, r0
    sub r18, r24
    movw r24, r18
    pop r21
    pop r20
    pop r19
    pop r18
    ret


.global sumOddsUint8
sumOddsUint8:
  // TODO uint16_t sumOddsUint8(uint8_t a, uint8_t b)
  ldi r27, 0
  ldi r26, 0
  mov r20, r24         ; r20 = a
  mov r21, r22         ; r21 = b

loop_start:
    cp r21, r20     
    brlo loop_end        
    mov r24, r20         
    ldi r22, 2           
    call slowModulusUint8 
    cp r24, r1
    breq not_odd         
    add r26, r20
    adc r27, r1       

not_odd:
    cpi r20, 255
    breq loop_end 
    inc r20           
    jmp loop_start      


loop_end:
  mov r24, r26
  mov r25, r27
  ret

