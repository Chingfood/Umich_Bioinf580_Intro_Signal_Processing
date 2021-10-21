function main_function
% Please comment on your code

% First, load the ecg file. Make sure file is in path

load('/home/chingyuen/Downloads/Assignment 1/ecg.mat')
%%
% Place your code for the question 1 in this section
L = length(ecg)/Fs;
t = 0:1/Fs:L;
t = t(1:end-1);
figure;plot(t, ecg)
xlabel('Time (s)')
ylabel('Signal')
title('Plot of whole ECG data')
figure;plot(t(1:5*Fs), ecg(1:5*Fs))
xlabel('Time (s)')
ylabel('Signal')
title('Plot of 5sec ECG data')
figure;plot(t(1:60*Fs), ecg(1:60*Fs))
xlabel('Time (s)')
ylabel('Signal')
title('Plot of 60sec ECG data')


%%
% Place your code for the question 2 in this section
Y = fft(ecg); % fast fourier transform
magnitude_Y = abs(Y);  % you should use abs(Y) if you want to plot the magnitude of the fourier transform
f = (0:length(Y)-1)*Fs/(length(Y)); % form the vector of frequencies such that size(f) = size(Y) and the first and last elements in f are 0 and Fs, respectively.
figure;plot(f(,magnitude_Y)
xlabel('Frequency (Hz)');
ylabel('|magnitude|')
title('Fourier transform of ecg')




%%
% If needed, place your code for the question 3 in this section
[M,I] = maxk(magnitude_Y,10)
fm=f(I)



%%
% Place your code for the question 4 in this section
[bl,al] = butter(3,[0.7 40]*2/Fs,'bandpass');
ecg1 = filter(bl,al,ecg);
[bl,al] = butter(3,[55 65]*2/Fs,'stop');
ecg2 = filter(bl,al,ecg1);
figure;plot(t(60*Fs:65*Fs), ecg2(60*Fs:65*Fs),'r')
hold on;
plot(t(60*Fs:65*Fs), ecg(60*Fs:65*Fs))
xlabel('Time (sec)');
ylabel('Signal')
title('Filtered signal vs. unfiltered')
legend('filtered','unfiltered')


%%
% Place your code for the question 5 in this section
Y_f=fft(ecg2)
magnitude_Y_f = abs(Y_f);
figure;plot(f(1:40*Fs),magnitude_Y_f(1:40*Fs), 'r')
hold on; plot(f(1:40*Fs),magnitude_Y(1:40*Fs))
xlabel('Frequency (Hz)');
ylabel('|magnitude|')
title('Fourier transform of Filtered signal vs. Unfiltered signal')
legend('filtered','unfiltered')




%%
% Place your code for the question 6 in this section

% The function asystole_detection is called below. You can step in the 
% function, using "Step In" option in editor panel.  
[alarm,t] = asystole_detection(ecg, Fs) 

% Plot alarm vs t
figure; plot (t,alarm)
xlabel('Time (sec)');
ylabel('Alarm (1 is positive, 0 is negative)')
title('alarmed status vs. time')
end