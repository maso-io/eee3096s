%For generating the look up table for a 10-bit DAC
%Cited: https://deepbluembedded.com/stm32-dac-sine-wave-generation-stm32-dac-dma-timer-example/

clear; clc;   % Clear The Previous Points
Ns     = 128; % Set The Number of Sample Points
RES    = 10;  % Set The DAC Resolution
OFFSET = 0;   % Set An Offset Value For The DAC Output
%------------[ Calculate The Sample Points ]-------------
 
period = 0:((2*pi/(Ns-1))):(2*pi);
s = sin(period); 
triangle = sawtooth(period , 0.5);
saw = sawtooth(period);

s = s + 1;
s = s*((2^RES-1)-2*OFFSET)/(2+OFFSET);
triangle = triangle + 1;
triangle = triangle*((2^RES-1)-2*OFFSET)/(2+OFFSET);
saw = saw + 1;
saw = saw*((2^RES-1)-2*OFFSET)/(2+OFFSET);
s = round(s);
triangle = round(triangle);
saw = round(saw);

%Plots of generate DAC lookup values
plot(period ,s, 'p');
hold on
plot(period ,triangle, 'p');
plot(period ,saw,'p');
title('DAC Lookup Values for Sin, Triangle and Sawtooth Waveform');
xlabel('Period T');
ylabel('Value');
set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','pi/2','pi','3*pi/2','2*pi'})
hold off
grid
%--------------[ Print The Sample Points ]---------------

fprintf("\nLookup values for sine waveform\n");
fprintf('%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, \n', s);
fprintf("\nLookup values for sawtooth waveform\n");
fprintf('%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, \n', saw);
fprintf("\nLookup values for triangle waveform\n");
fprintf('%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, \n', triangle);
