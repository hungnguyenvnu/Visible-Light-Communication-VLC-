function [ est_angle ] = computeWeight( P,PD_angle )
%% Chuc nang: Ham tinh goc uoc luong theo phuong phap "Truncated-Weighting"
global K;

%% Tim vi tri PD thu i ma tai do dat Pmax
temp = P(1);
k = 1;
for i = 1:K
    if temp < P(i)
        temp = P(i);
        k = i;
    end
end

%% Uoc luong goc

TS = 0;
MS = 0;
% Truong hop k = 1
if k == 1
    for i = k:(k+1)
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
    
    % Truong hop k = K
elseif k == K
    for i = (k-1):k
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
    
    % Truong hop 1<k<K
elseif k > 1 && k < K
    for i = (k-1):(k+1)
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
end

est_angle = TS/MS;


end

