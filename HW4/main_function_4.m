%% 1a
load('data1.mat') ;
figure;
plot(X(:,1),X(:,2),'.','markersize',10);



%% 1b
 
xlim([0,60]);
ylim([0,60]);


%% 1c

[idx,cs] = k_means(X, 5, 'mahalanobis', 10);


%% 1d
replications = 10;
myfunc = @(X,k)(k_means(X, k, 'mahalanobis', replications ));

eva1 = evalclusters(X,myfunc,'DaviesBouldin','KList',[2:10]);
figure;plot(eva1)



%% 1e

eva2 = evalclusters(X,myfunc,'CalinskiHarabasz','KList',[2:10]);
figure;plot(eva2)


%% 1f

[idx,cs] = k_means(X, 5, 'mahalanobis', 10);


%% 2a
clear all
close all

load('data2.mat') ;

for i = 1:15
    figure;
    for j = 1:15
        if (j ~= i)
            subplot(5,3,j);
            plot(X(:,i),X(:,j),'.','markersize',10);
        end
    end
end
close all

%3vs9 3vs12 3vs14 3vs15 9vs14 12vs 14
figure;
subplot(3,2,1);
plot(X(:,3),X(:,9),'.','markersize',10);
title('dimension 9 vs. dimension 3');
ylabel('dimension9');
xlabel('dimension3');
subplot(3,2,2);
plot(X(:,3),X(:,12),'.','markersize',10);
title('dimension 12 vs. dimension 3');
ylabel('dimension12');
xlabel('dimension3');
subplot(3,2,3);
plot(X(:,3),X(:,14),'.','markersize',10);
title('dimension 14 vs. dimension 3');
ylabel('dimension14');
xlabel('dimension3');
subplot(3,2,4);
plot(X(:,3),X(:,15),'.','markersize',10);
title('dimension 15 vs. dimension 3');
ylabel('dimension15');
xlabel('dimension3');
subplot(3,2,5);
plot(X(:,9),X(:,14),'.','markersize',10);
title('dimension 14 vs. dimension 9');
ylabel('dimension14');
xlabel('dimension9');
subplot(3,2,6);
plot(X(:,12),X(:,14),'.','markersize',10);
title('dimension 14 vs. dimension 12');
ylabel('dimension14');
xlabel('dimension12');
%% 2b
close all;
myfunc = @(X,k)(kmeans(X, k, 'Replicates', 5));

eva1 = evalclusters(X,myfunc,'DaviesBouldin','KList',[2:10]);
figure;plot(eva1)

eva2 = evalclusters(X,myfunc,'CalinskiHarabasz','KList',[2:10]);
figure;plot(eva2)


 


%% 2c
close all;

k =7; %number of clustering center is 7

%Dimension9 vs. Dimension3
[idx,cs] = kmeans([X(:,3),X(:,9)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,3),X(idx==i,9),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 9 vs. dimension 3');
ylabel('dimension9');
xlabel('dimension3');

%Dimension12 vs. Dimension3
[idx,cs] = kmeans([X(:,3),X(:,12)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,3),X(idx==i,12),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 12 vs. dimension 3');
ylabel('dimension12');
xlabel('dimension3');

%Dimension14 vs. Dimension3
[idx,cs] = kmeans([X(:,3),X(:,14)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,3),X(idx==i,14),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 14 vs. dimension 3');
ylabel('dimension14');
xlabel('dimension3');


%Dimension15 vs. Dimension3
[idx,cs] = kmeans([X(:,3),X(:,15)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,3),X(idx==i,15),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 15 vs. dimension 3');
ylabel('dimension15');
xlabel('dimension3');

%Dimension14 vs. Dimension9
[idx,cs] = kmeans([X(:,9),X(:,14)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,9),X(idx==i,14),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 14 vs. dimension 9');
ylabel('dimension14');
xlabel('dimension9');

%Dimension14 vs. Dimension12
[idx,cs] = kmeans([X(:,14),X(:,12)],k, 'Replicates', 5); % cluster X into 7 clusters using matlab's kmeans function

figure;
for i = 1:k
    plot(X(idx==i,12),X(idx==i,14),'.','markersize',10);  % plot the clusters
    hold all;
    plot(cs(i,1),cs(i,2),'x','markersize',10);  % plot the cluster centers
end
title('dimension 14 vs. dimension 12');
ylabel('dimension14');
xlabel('dimension12');
