function [idx,cs] = k_means(X, k, dist, replications)

    if(nargin<4)    % if dist is not provided, use euclidean distance
        dist = 'euclidean';
    end
    
    cs = zeros(k,size(X,2)); 
    idx = zeros(size(X,1),1);
    sum_min = Inf;
    
    for rep = 1:replications
        
        n = size(X,1);  % number of data points

        rp = randperm(n);   % randomly choose k data points as initial cluster centers
        new_cs = X(rp(1:k),:);        

        old_cs = zeros(size(new_cs));

      
        while(any(new_cs~=old_cs))  % continue until the cluster centers are stabilize
            old_cs = new_cs;
        
            D = distance(X,new_cs,dist); % find the distances
        
            [min_distance,new_idx] = min(D,[],2);  % assign data points to clusters
               
            new_cs = [];
            for i = 1:k
                new_cs(i,:) = mean(X(new_idx==i,:));    % find the new cluster centers
            end
        
        end
        
        
        if (sum(min_distance) < sum_min)
            sum_min = sum(min_distance);
            cs = new_cs;
            idx = new_idx;
        end
    end
    
    figure;  
    for i = 1:k
        plot(X(idx==i,1),X(idx==i,2),'.','markersize',10); % plot the clusters
        hold on;
        plot(cs(i,1),cs(i,2),'x','markersize',10); % plot the cluster centers
    end
    
end

function D = distance(X,Y,dist)
    D = squareform(pdist([X ; Y],dist));    % find all the distances according to the distance metric
    D = D(1:size(X,1),end-size(Y,1)+1:end); % only keep the distances between points in X and Y
end