# FPU-Analyzer Assembly Program

This repository contains an assembly program written in AT&T syntax called `FPU-Analyzer`. The program analyzes a series of floating-point numbers and calculates their sum and average.


## Description

The `FPU-Analyzer` program prompts the user to provide the following inputs:

1. An integer `n`, representing the number of elements in the series.
2. `n` floating-point numbers of type "double".

The program then calculates the sum and average of the input numbers and displays the results as output.

The program utilizes the x87 FPU instructions for floating-point arithmetic operations and the C standard library functions `scanf` and `printf` for input and output operations.

## Compilation

To compile the assembly program on Windows using `gcc`, you can use the following command:

```shell
gcc -O3 -o FPU-Analyzer.exe FPU-Analyzer.s
```
Please note that the compilation command assumes a Windows environment and uses the gcc compiler for Windows. Adjust the command accordingly for your specific platform and compiler.


## Code

The assembly code is written in AT&T syntax and consists of the following sections and instructions:

### Data Section

The `.data` section contains the declaration of memory variables used in the program:

- `numInput`: A format string for reading a double-precision floating-point number from user input.
- `num`: A double-precision floating-point variable to store the input number.
- `numOfElementsInput`: A format string for reading an integer representing the number of elements from user input.
- `numOfElements`: An integer variable to store the number of elements.
- `outSum`: A format string for printing the sum.
- `outAverage`: A format string for printing the average.
- `sum`: A double-precision floating-point variable to store the sum.
- `average`: A double-precision floating-point variable to store the average.
- `counter`: A double-precision floating-point variable to store the number of elements as a double.
- `one`: A double-precision floating-point variable with a value of 1.0.

### Text Section

The `.text` section contains the program's instructions:

#### _main function

The entry point of the program.

- Prompt the user to input the number of elements:

  - Push the address of `numOfElements` onto the stack.
  - Push the address of `numOfElementsInput` onto the stack.
  - Call the `scanf` function to read an integer from user input.
  - Adjust the stack pointer to remove the arguments.

- Loop to get the input numbers and calculate the sum:

  - Load the format string `numInput` into the `%eax` register.
  - Store the address of `num` at an offset from the stack pointer.
  - Store the format string address at the top of the stack.
  - Call the `scanf` function to read a double number from user input.
  - Load the current value of `sum` into the floating-point unit (FPU) register.
  - Add the input number (`num`) to the sum using FPU instructions.
  - Store the updated sum back into memory.
  - Load the current value of `counter` into the FPU register.
  - Add one to the counter using FPU instructions.
  - Store the updated counter back into memory.
  - Decrement the `numOfElements` by 1.
  - Compare the value of `numOfElements` with 0.
  - If the result is greater than 0, jump back to the `loop1` label to repeat the loop.

- Calculate the average:

  - Load the value of `sum` into the FPU register.
  - Divide sum by counter using FPU instructions.
  - Store the result (`average`) back into memory.

- Print the sum and average:

  - Push the address of `sum` onto the stack.
  - Push the address of `sum+4` (high-order 32 bits) onto the stack.
  - Push the address of `outSum` (format string) onto the stack.
  - Call the `printf` function to print the sum.
  - Push the address of `average` onto the stack.
  - Push the address of `average+4` (high-order 32 bits) onto the stack.
  - Push the address of outAverage (format string) onto the stack.
  - Call the printf function to print the average.


## Usage

After successfully compiling the program, you can run the `FPU-Analyzer.exe` executable on Windows or execute the resulting binary on your platform. The program will prompt you for inputs, and after providing the required information, it will display the calculated sum and average of the input numbers.

Please note that this program is intended for educational purposes and serves as an example of assembly programming using AT&T syntax.

## Requirements

To compile and run the FPU-Analyzer assembly program, you'll need the following:

- A compatible assembler and linker (such as `gcc`) for your platform.
- An environment that supports x87 FPU instructions.
- Basic knowledge of assembly language programming concepts.

## Contributing

Contributions to the FPU-Analyzer assembly program are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

The FPU-Analyzer assembly program is licensed under the MIT License. You are free to use, modify, and distribute the code for personal. See the [LICENSE] file for more details.
