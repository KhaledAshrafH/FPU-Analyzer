# To compile this assembly program on windows:
# gcc -O3 -o SumAverage.exe SumAverage.s

# ------------------------------------------------------------------------------------------------------
                                  # initialized memory variables
.section .data

numInput: .asciz "%lf\0"
num: .double 0.0

numOfElementsInput: .asciz "%d\0"
numOfElements: .int 0

outSum: .asciz "sum=%lf "
outAverage: .asciz "avg=%lf" 
sum: .double 0.0
average: .double 0.0

counter: .double 0.0 # to store number of elements as a double
one: .double 1.0
# ------------------------------------------------------------------------------------------------------
                                  # instructions
.section .text

.globl _main

_main:
   # Get input number of elements
   pushl $numOfElements
   pushl $numOfElementsInput
   call _scanf
   add $8, %esp

loop1:
   # Get input double number
   movl $numInput, %eax
   movl $num, 4(%esp)
   movl %eax, (%esp)
   call _scanf
   # add the double number to the sum
   fldl sum
   faddl num
   fstpl sum
   # increment the counter by 1
   fldl counter
   faddl one
   fstpl counter
   # decrement number of elements by 1
   addl $-1,numOfElements
   # Loop Condition
   cmpl $0, numOfElements
   ja loop1 # go to loop1

   # calculate average
   fldl sum
   fdivl counter
   fstpl average
   # print the Sum
   pushl sum+4
   pushl sum
   pushl $outSum
   call _printf
   # print the Average
   pushl average+4
   pushl average
   pushl $outAverage
   call _printf
   # Pop the stack
   add $24, %esp 
   ret
