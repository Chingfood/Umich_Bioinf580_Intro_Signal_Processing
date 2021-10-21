function [alarm,t] = asystole_detection(ecg, Fs)
% Hint: choose your sliding window lenghth to be 4 sec since asystole is 
% defined as the absence of a QRS complex for at least 4 seconds.
% you can use the find_power.mat code that was used in the class(also 
% available in assignment 2 package.

% Don't fogret to comment on your code!

    alarm = [];
    t= [];
    win_size = 4*Fs; % 4 second sliding window size
    
 % To filter out noise in the data
 % Trial and error finds only keeps d1 d2 d3 produce best results.
    [C,L] = wavedec(ecg,7,'db4'); % C is the coefficient vector, while L is the bookkeeping vector
                              % that contains the number of coefficients by
                              % level, L = [an dn dn-1 ... d1]
    
    C(1 : L(1)) = 0; % set a7 to 0
    C(L(1)+1: L(1)+L(2)+L(3)+L(4)+L(5)) = 0; % set d7 d6 d5 d4 to zero
    ecg_high = waverec(C,L,'db4'); %reconstruct the signal
    [ecg_hi_pw,t] = find_power(ecg_high,Fs); %power value is the feature  
    t = t./Fs;
    for i = 1 : length(ecg_hi_pw)
        if (ecg_hi_pw(i) < 3000)
            alarm(end+1) = 1; % if ecg_hi_pw < 3000, there is no heart rate detected for 4 seconds.
        else
            alarm(end+1) = 0; % 1 is alarmed, 0 is unalarmed.
        end
    end
 
    
    

end