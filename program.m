%filter
ftype = 'bandpass'; %because lw has two elements
Fs = 20;
bot = 0.3;
top = 4;

%entropy
m = 3;
r = 0.15;

%signals 3
%PE
load('tpehg1476m.mat');
signalPE = val(9,:);
figure(1);
plot(signalPE);
signalPE= doFilter(signalPE, bot, top, Fs, ftype);
signalPE = signalPE(181*Fs:end-181*Fs); %When using filtered channels, note that the first and last 180 seconds of the signals should be ignored since these intervals contain transient effects of the filters. 

sePE = sampleEntropy(signalPE, m, r)

%PL
load('tpehg745m.mat');
signalPL = val(9,:);
figure(2);
plot(signalPL);
signalPL = doFilter(signalPL, bot, top, Fs, ftype);
signalPL = signalPL(181*Fs:end-181*Fs);

sePL = sampleEntropy(signalPL, m, r)

%TE
load('tpehg604m.mat');
signalTE = val(9,:);
figure(3);
plot(signalTE);
signalTE= doFilter(signalTE, bot, top, Fs, ftype);
signalTE = signalTE(181*Fs:end-181*Fs);

seTE = sampleEntropy(signalTE, m, r)

%TL
load('tpehg1216m.mat');
signalTL = val(9,:);
figure(4);
plot(signalTL);
signalTL= doFilter(signalTL, bot, top, Fs, ftype);
sigbalTL = signalTL(181*Fs:end-181*Fs);

seTL = sampleEntropy(signalTL, m, r)

%signal 2
load('tpehg1476m.mat');
signalPE2 = val(5,:);
figure(5);
plot(signalPE2);
signalPE2= doFilter(signalPE2, bot, top, Fs, ftype);
signalPE2 = signalPE2(181*Fs:end-181*Fs); 

sePE2 = sampleEntropy(signalPE2, m, r)
