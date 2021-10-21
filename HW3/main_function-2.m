function main_function
% Please comment on your code
%%
% Place your code for the question 2 in this section
S = load('ecg.mat');
ecg = S.ecg;   % S is a struct that contains the ecg signal and sampling rate. You can access the elements within a struct using the dot syntax.
Fs = S.Fs;
[C,L] = wavedec(ecg,7,'db4');
C(1 : L(1)) = 0; % set a7 to 0
C(L(1)+1: L(1)+L(2)) = 0; % set d7 to zero
ecg_high = waverec(C,L,'db4'); % reconstruct the signal from d1 to d6
window_size = 4*Fs; %window size 4 sec
step = 1*Fs; %step size 1 sec
alpha = 1; %Shannon Entropy
t_ecg = (1:length(ecg_high))/Fs;
t_entropy = [];
renyiEntropy = [];

for i = 1: step : length(ecg_high) - window_size
    renyiEntropy(end+1) = renyi_entro(ecg_high(i:i+window_size-1),alpha);
    t_entropy(end+1) = (i + window_size/2-1)/Fs;
end


%%
% Place your code for the question 3, generating plots 
figure; ax1 = subplot(2,1,1);
plot(ax1, t_ecg, ecg_high)
title('denoised ecg signal')
xlabel('Time (s)')
ylabel('ecg')
ax2 = subplot(2,1,2);
plot(ax2, t_entropy, renyiEntropy)
title('Shannon Entropy')
xlabel('Time (s)')
ylabel('Entropy')



end