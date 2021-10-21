function [alarm,t] = asystole_detection(ecg, FS)
% Compute a feature (value) from a sliding window in the frequency or time 
% domain that has different values at the end of the signal!

% Hint: choose your sliding window lenght to be 4 sec since asystole is 
% defined as the absence of a QRS complex for at least 4 seconds.

% Don't fogret to comment on your code!
    alarm = [];
    t= [];
    win_size = 4*FS; % 4 second sliding window size
    
    step = 1*FS; % sliding window step size
    for i = 1:step:length(ecg)-win_size+1 % i specifies the beginning of the window
        win = ecg(i:i+win_size-1);
        t(end+1) = (i+win_size/2)/FS;
        [bl,al] = butter(3,[0.7 40]*2/FS,'bandpass');
        win1 = filter(bl,al,win);
        [bl,al] = butter(3,[55 65]*2/FS,'stop');
        win2 = filter(bl,al,win1);
        Y = fft(win2);
        f = (0:length(Y)-1)*FS/(length(Y));
        Y_magnitude=abs(Y)
        
        [feature,idx] = max(Y_magnitude(1.25/FS*length(f): 2.5/FS*length(f))); % find the indices that correspond to the desired range of heart rate, from 75 bpm to 150 bpm
        
        if (feature < 7e4)
            alarm(end+1) = 1 % if feature < 2e5, there is no frequency peak regarding heart rate. 1 means alarmed, 0 means unalarmed
        else
            alarm(end+1) = 0
        end
    end
    
    


end