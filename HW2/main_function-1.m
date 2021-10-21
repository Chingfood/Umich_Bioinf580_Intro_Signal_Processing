function main_function
% Please comment on your code

% First, load the ecg file. Make sure file is in path
S = load('ecg.mat');
ecg = S.ecg;   % S is a struct that contains the ecg signal and sampling rate. You can access the elements within a struct using the dot syntax.
Fs = S.Fs;

figure;plot(ecg)    % The ecg signal contains sinus rhythm and ventricular fibrillation 

waveletAnalyzer   
%%
% Place your code for the question 2 in this section
[C,L] = wavedec(ecg,7,'db4'); % C is the coefficient vector, while L is the bookkeeping vector
                              % that contains the number of coefficients by
                              % level, L = [an dn dn-1 ... d1]
C1=C;% make a copy of c value for ecg_low computation
C(1 : L(1)) = 0; % set a7 to 0
C(L(1)+1: L(1)+L(2)+L(3)+L(4)) = 0; % set d7 d6 d5 to zero
ecg_high = waverec(C,L,'db4'); % reconstruct the signal from d1 to d4
C1(L(1)+L(2)+L(3)+L(4)+1 : end) = 0 ;% set d4 d3 d2 d1 to zero
ecg_low = waverec(C1,L,'db4'); % reconstruct the signal from d5 to a7
figure;
ax1 = subplot(2,1,1);
plot(ax1,ecg_high); %subplot ecg_high_frequency component 
hold on; plot(ax1,ecg); %plot the unfiltered signal together
title('residual signal vs. unfilered signal');%this is same as residual sig
ylim([min(ecg) max(ecg)]);
xlim([3.46e4, 3.64e4]) %set range
legend('residual signal' , 'unfiltered signal')
ax2 = subplot(2,1,2); %subplot the ecg_low_frequency component
plot(ax2,ecg_low);
title('denoised signal'); % this is same as denoised signal
ylim([min(ecg_low) max(ecg_low)]);
xlim([2.10e4, 2.60e4]) % set range


%%
% question 6 

% The function asystole_detection is called below. You can step in the 
% function, using "Step In" option in editor panel.  
[alarm,t] = asystole_detection(ecg, Fs) 
figure; plot(t,alarm);
xlabel('Time (sec)');
ylabel('Alarm (1 is positive, 0 is negative)')
title('alarmed status vs. time')
% Plot alarm vs t

end