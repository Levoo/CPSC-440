# Author: Fernando Cuevas
# Class: CPSC 440 MON/WEN 1-2:15
# Professor: Heckethorn
# Program: SMIPS asm program to lower uppercase chars
# SMIPS set up: Works on Simple Machine pre-set 

.data
string:  .asciiz    "ABCDEFG"

.text
.globl main

main:
    la  $9, string     # load the address of the string
    li  $10, 0         # iterater for loop
    ori $8, $0, 0x20   # add 32 to each letter to make lower

    changeToLower:
        add $11, $9, $10 # $11 = string[i]
        lb $12, 0($11)    # load single char into $12
        beq $12, $zero, exit # of we reach end of string memory exit
        add $12, $12, $8  # add 32 to get to lower
        sb $12 ($11) # save changed char back to same memory location
        addi $10, $10, 1 # increase iterator
        j changeToLower # jump back until lower
    exit:
