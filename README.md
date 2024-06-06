# RIGOL-data-converter
Data Converter for RIGOL DHO924S Oscilloscope Arbitrary Function Generator

Basic example is a simple sine wave;
- All files must have 8192 points;
- All value are in volt voltage beyond +-0.312 Volt seems clipped;
- Format is header than a list of voltaqge point in vertical list without the time coordinate;
- Volts can be fix or sci notation and always after comma without time.

Header must be in form:

![image](https://github.com/LuizFernandoOliveira/RIGOL-data-converter/assets/50978651/56430070-175c-4a38-b18c-16aa7599b159)

At least one empty line at the end of file.

- The maximum rate of output of the table is 10 MHz;
- File can be .txt or .csv;
- Param in the header are read to initialise the generator;
- Period and frequency must be consistent;
- Period is the duration of the generated voltage table. If only one cycle sine is present, then this gives directly the frequency;
- Amp is the expected pk-pk amplitude;
- Behavioir is strange putting table with more than 0.647 V give a clipped waveform. This is why I max out at +-0.312 V in the table.
  
# How to run

Run the "main.m" file in MATLAB R2023b. After executing the code, MATLAB will generate the "output.csv" file in the same folder as the "main.m" file. This file "output.csv" represents the signal generated in MATLAB in CSV format with the header recognized by the RIGOL DHO924S Oscilloscope.

# Example

Signal generated in MATLAB:

![fig](https://github.com/LuizFernandoOliveira/RIGOL-data-converter/assets/50978651/959ca08a-58f2-485b-909e-5d4c966078e1)


Signal reproduced on the RIGOL Oscilloscope:

![RigolDS0](https://github.com/LuizFernandoOliveira/RIGOL-data-converter/assets/50978651/d01e4d85-7ada-48d1-a17a-ad654770aef1)


