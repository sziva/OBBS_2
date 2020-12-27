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
load('./data/tpehg1476m.mat');
signalPE = val(9,:);

%{
figure(1);
tiledlayout(2,1);
nexttile
plot(signalPE);
title('original')
%}

signalPE= doFilter(signalPE, bot, top, Fs, ftype);
signalPE = signalPE(181*Fs:end-181*Fs); %When using filtered channels, note that the first and last 180 seconds of the signals should be ignored since these intervals contain transient effects of the filters. 

%{
nexttile
plot(signalPE);
title('filtered')
%}

sePE = sampleEntropy(signalPE, m, r)
sepPE = sampen(signalPE,m+1,r,1,0,0)

%PL
load('./data/tpehg745m.mat');
signalPL = val(9,:);

%{
figure(2);
tiledlayout(2,1);
nexttile
plot(signalPL);
title('original')
%}

signalPL = doFilter(signalPL, bot, top, Fs, ftype);
signalPL = signalPL(181*Fs:end-181*Fs);

%{
nexttile
plot(signalPL);
title('filtered')
%}

sePL = sampleEntropy(signalPL, m, r)
sepPL = sampen(signalPL,m+1,r,1,0,0)

%TE
load('./data/tpehg604m.mat');
signalTE = val(9,:);

%{
figure(3);
tiledlayout(2,1);
nexttile
plot(signalTE);
title('original')
%}

signalTE= doFilter(signalTE, bot, top, Fs, ftype);
signalTE = signalTE(181*Fs:end-181*Fs);

%{
nexttile
plot(signalTE);
title('filtered')
%}

seTE = sampleEntropy(signalTE, m, r)
sepTE = sampen(signalTE,m+1,r,1,0,0)

%TL
load('./data/tpehg1216m.mat');
signalTL = val(9,:);

%{
figure(4);
tiledlayout(2,1);
nexttile
plot(signalTL);
title('original')
%}

signalTL= doFilter(signalTL, bot, top, Fs, ftype);
signalTL = signalTL(181*Fs:end-181*Fs);

%{
nexttile
plot(signalTL);
title('filtered')
%}

seTL = sampleEntropy(signalTL, m, r)
sepTL = sampen(signalTL,m+1,r,1,0,0)

%signal 2
load('./data/tpehg1476m.mat');
signalPE2 = val(5,:);

%{
figure(5);
tiledlayout(2,1);
nexttile
plot(signalPE2);
title('original')
%}

signalPE2= doFilter(signalPE2, bot, top, Fs, ftype);
signalPE2 = signalPE2(181*Fs:end-181*Fs); 

%{
nexttile
plot(signalPE2);
title('filtered')
%}

sePE2 = sampleEntropy(signalPE2, m, r)
sepPE2 = sampen(signalPE2,m+1,r,1,0,0)