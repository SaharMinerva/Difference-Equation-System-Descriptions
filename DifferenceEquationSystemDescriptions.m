%% Difference Equation System Descriptions
%
% Copyright Barry Van Veen 2014

%% Set up workspace
%
% The filter function computes the output of a system using a difference
% equation with coefficients in vectors B (applied to x[n], x[n-1], ...)
% and A (applied to y[n], y[n-1], ...).  It assumes the coefficient of y[n]
% is unity (A(1) = 1), or else normalizes A and B to make A(1) unity

clear
close all
set(0,'defaultaxesfontsize',22);
set(0,'defaulttextfontsize',22);
linwidth = 2;


% Input signals for examples

cs1 = cos([0:119]*pi/8); % low frequency cosine
cs2 = cos([0:119]*7*pi/8); % high frequency cosine
stp = [ zeros(1,20), ones(1,100)]; % signal with a step change at n = 20

%% System 1: 6 point averaging

B = [ 1 1 1 1 1 1]/6;
A = 1;

yc1 = filter(B,A,cs1);
yc2 = filter(B,A,cs2);
ys = filter(B,A,stp);

figure(1)

subplot(3,1,1)
hp = stem([0:length(ys)-1],ys);
set(hp,'LineWidth',linwidth);
title('6 pt Avg: Step Response')
subplot(3,1,2)
hp = stem([0:length(yc1)-1],yc1);
set(hp,'LineWidth',linwidth);
title('6 pt Avg: Low Frequency Cosine')
subplot(3,1,3)
hp = stem([0:length(yc2)-1],yc2);
set(hp,'LineWidth',linwidth);
title('6 pt Avg: High Frequency Cosine')

h = get(0,'CurrentFigure');
set(h,'Position',[0,0,1000,600])

%% System 2: 6 point difference

B = [1 -1 1 -1 1 -1]/6;
A = 1;

yc1 = filter(B,A,cs1);
yc2 = filter(B,A,cs2);
ys = filter(B,A,stp);

figure(2)

subplot(3,1,1)
hp = stem([0:length(ys)-1],ys);
set(hp,'LineWidth',linwidth);
title('6 pt Diff: Step Response')
subplot(3,1,2)
hp = stem([0:length(yc1)-1],yc1);
set(hp,'LineWidth',linwidth);
title('6 pt Diff: Low Frequency Cosine')
subplot(3,1,3)
hp = stem([0:length(yc2)-1],yc2);
set(hp,'LineWidth',linwidth);
title('6 pt Diff: High Frequency Cosine')

h = get(0,'CurrentFigure');
set(h,'Position',[0,0,1000,600])

%% System 3: First-order recursive system y[n] = 0.95y[n-1] + 0.05x[n]

B = 0.05;
A = [1 -0.95];

yc1 = filter(B,A,cs1);
yc2 = filter(B,A,cs2);
ys = filter(B,A,stp);

figure(3)

subplot(3,1,1)
hp = stem([0:length(ys)-1],ys);
set(hp,'LineWidth',linwidth);
title('Recursive Low Pass: Step Response')
subplot(3,1,2)
hp = stem([0:length(yc1)-1],yc1);
set(hp,'LineWidth',linwidth);
title('Recursive Low Pass: Low Frequency Cosine')
subplot(3,1,3)
hp = stem([0:length(yc2)-1],yc2);
set(hp,'LineWidth',linwidth);
title('Recursive Low Pass: High Frequency Cosine')

h = get(0,'CurrentFigure');
set(h,'Position',[0,0,1000,600])

%% System 4: First-order recursive system y[n] = -0.95y[n-1] + 0.05x[n]

B = 0.05;
A = [1 0.95];

yc1 = filter(B,A,cs1);
yc2 = filter(B,A,cs2);
ys = filter(B,A,stp);

figure(4)

subplot(3,1,1)
hp = stem([0:length(ys)-1],ys);
set(hp,'LineWidth',linwidth);
title('Recursive High Pass: Step Response')
subplot(3,1,2)
hp = stem([0:length(yc1)-1],yc1);
set(hp,'LineWidth',linwidth);
title('Recursive High Pass: Low Frequency Cosine')
subplot(3,1,3)
hp = stem([0:length(yc2)-1],yc2);
set(hp,'LineWidth',linwidth);
title('Recursive High Pass: High Frequency Cosine')

h = get(0,'CurrentFigure');
set(h,'Position',[0,0,1000,600])

