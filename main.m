%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Converter for RIGOL DHO924S Oscilloscope Arbitrary Function Generator
% Author:   Luiz Oliveira
% Date:     05/06/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example of a sinusoidal function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 8192;
AMP = 1;
FREQ = 250e3;
PERIOD = 1/FREQ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example of a sinusoidal function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:(1/(N-1)):1;
y = 0.5*sin(2*pi*t)';
plot(t,y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the CSV file that will be generated
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fileID = fopen('output.csv','w');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mandatory header in RIGOL DHO924S Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fileID,'RIGOL:DG1:CSV DATA FILE\n');
fprintf(fileID,'TYPE:Arb\n');
fprintf(fileID,'AMP:%.3f Vpp\n',AMP);
fprintf(fileID,'PERIOD:%.3f S\n',PERIOD);
fprintf(fileID,'DOTS:8192\n');
fprintf(fileID,'MODE:Freq\n');
fprintf(fileID,'AFG Frequency:%.3f\n',FREQ);
fprintf(fileID,'AWG N:0\n');
fprintf(fileID,'x,y[V]\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data being saved to CSV file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(t)
    fprintf(fileID,',%.5f\n',y(i,1));
end
fprintf(fileID,'\n');

fclose(fileID);