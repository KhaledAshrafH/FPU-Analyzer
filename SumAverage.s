# To download gcc on windows:
# download mingw (and make sure gcc is chosen while installation) from: 
# mingw-get-setup.exe at the site https://osdn.net/projects/mingw/
# then append c:\mingw\bin; to the start of the PATH environment variable from control panel

# To compile this assembly program on windows:
# gcc -O3 -o SumAverage.exe SumAverage.s
# After running the program, enter a positive integer (n<=400) and then enter n integers then press enter

#------------------------------------------------------------------------------------------------------

.section .data        # initialized memory variables, will be part of the exe
_inputnum: .asciz "%lf\0"
inputNumbers: .asciz "%d\0"
outAverage: .asciz "The average is: %lf\n" 
outSum: .asciz "The Sum is: %lf\n"
_tmp: .double 0
sum: .double 0
average: .double 0
numbers: .int 3
counter: .double 0
one: .double 1.0
#------------------------------------------------------------------------------------------------------



.section .text        # instructions

.globl _main          # make _main accessible from external

_main:                # the label indicating the start of the program


  
  pushl $numbers         
   pushl $inputNumbers      
   call _scanf   
   add $8, %esp 

    # movl $numbers,counter 
loop1:
    movl $_inputnum, %eax		
    movl $_tmp, 4(%esp)
    movl %eax, (%esp)
    call _scanf
    fldl sum          # push 1 to the floating point stack
    faddl _tmp           # pop the floating point stack top (1), add it to r and push the    
    fstpl sum  
    fldl counter         # push 1 to the floating point stack
    faddl one          # pop the floating point stack top (1), add it to r and push the    
    fstpl counter 
    addl $-1,numbers
    cmpl $0, numbers
    ja loop1
    

    # calculate average
    fldl sum          # push 1 to the floating point stack
    fdivl counter          # pop the floating point stack top (1), add it to r and push the  
    fstpl average  


    pushl sum+4
     pushl sum
     pushl $outSum    # push to stack the first parameter to printf
     call _printf          # call printf

     pushl average+4
     pushl average
     pushl $outAverage   # push to stack the first parameter to printf
     call _printf      
     
    
     add $24, %esp 
   
   ret
 

