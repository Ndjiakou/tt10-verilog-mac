<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.

-->

## How it works

The MAC Test module implements a simple MAC (Multiply-Accumulate) operation with the following I/O interface:

### Inputs:
- **in_a**: A 4-bit input operand `a` for the MAC operation.
- **in_b**: A 4-bit input operand `b` for the MAC operation.
- **in_valid_a**: A signal to indicate if `in_a` is valid.
- **in_valid_b**: A signal to indicate if `in_b` is valid.
- **clk**: Clock input for the module.
- **reset**: Active-low reset signal for the module.

### Outputs:
- **mac_out**: A 11-bit output representing the result of the MAC operation.
- **out_valid**: A signal indicating when the `mac_out` is valid.

### Functionality:
This module performs a simple multiply-accumulate operation between `in_a` and `in_b`, and outputs the result on `mac_out`. The result is only valid when the `out_valid` signal is high.

The module also includes a testbench that reads input data from a file, simulates the MAC operation, and compares the results with expected outputs.

### Modes of Operation:
The `mac_test` module works with an input test pattern and performs the following:

1. **Input Pattern Simulation**:
   - The test pattern is read from the file `pattern_in.txt`, where the input operands (`in_a` and `in_b`) and their validity signals are specified.
   - The module will multiply `in_a` and `in_b` and store the result in `mac_out`.

2. **Expected Output Comparison**:
   - The expected output for each input is read from the file `out_answer.txt`.
   - The module checks if the actual output `mac_out` matches the expected output at each clock cycle. If they match, the result is counted as successful.

### Example of Testing Process:

| Clock Cycle | in_a | in_b | in_valid_a | in_valid_b | mac_out (Result) | Expected mac_out | out_valid |
|-------------|------|------|------------|------------|------------------|------------------|-----------|
| 1           | 0001 | 0010 | 1          | 1          | 0010             | 0010             | 1         |
| 2           | 0011 | 0100 | 1          | 1          | 0110             | 0110             | 1         |
| 3           | 0100 | 1001 | 1          | 1          | 1001             | 1001             | 1         |

### How to test

1. **Pattern Input**:
   - Set the `in_a`, `in_b`, `in_valid_a`, and `in_valid_b` according to the test data in the `pattern_in.txt` file. This will simulate the MAC operation.
   
2. **Expected Output Comparison**:
   - Set `mac_out` to match the expected values stored in the `out_answer.txt` file.
   - Check the `out_valid` signal to ensure the output is valid.

3. **Error Checking**:
   - The testbench will check if the `mac_out` at each clock cycle matches the expected output. If the output is incorrect, it will print an error message indicating where the mismatch occurred.

4. **Simulation Completion**:
   - Once all the test cases are simulated, the testbench will print whether the MAC operation has passed or failed based on the comparison results.

### Pinout and Mapping

The following is a list of the input and output pins for the `mac_test` design:

| Pin Name      | Description                   |
|---------------|-------------------------------|
| **in_a[3:0]** | 4-bit input operand `a`        |
| **in_b[3:0]** | 4-bit input operand `b`        |
| **in_valid_a**| Input validity for `in_a`      |
| **in_valid_b**| Input validity for `in_b`      |
| **clk**       | Clock signal                   |
| **reset**     | Active-low reset signal        |
| **mac_out[10:0]** | 11-bit output for the MAC result |
| **out_valid** | Output validity signal         |

### Counter Mode
The testbench also simulates a counter mode where the outputs are compared to expected values for certain input patterns.

## Expected Results
1. **Successful Test**:
   - If all `mac_out` results match the expected values in `out_answer.txt`, the testbench will print:
