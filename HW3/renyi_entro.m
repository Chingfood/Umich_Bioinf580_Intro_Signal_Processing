function y=renyi_entro(DATA,alpha)

%% Calculating probability of each possible value. 
DATA = round(DATA,-2); 
unique_DATA = unique(DATA);
P = zeros(length(unique_DATA),1);

for i = 1: length(unique_DATA)
    P(i) = length(find(DATA == unique_DATA(i)))/length(DATA);
end

%% Calculating Renyi Entopy
if alpha == 0 % Hartley entropy
    % place your code here
    y = log2(sum(P(:)));
elseif alpha == 1 % Shannon entropy, note alpha-->1, but here we consider 
    % alpha=1 to pass the information into this function 
    y = -1*sum(P(:) .* log2(P(:)));
    % place your code here
else
    y=log2(sum(P(:).^alpha))/(1-alpha);
end
