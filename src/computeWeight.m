function [ est_angle ] = computeWeight( P,PD_angle )

% Function return the estimated angle based on method "Truncated-Weighting"

global K;

% Find the position of the ith PD, Pmax

temp = P(1);
k = 1;
for i = 1:K
    if temp < P(i)
        temp = P(i);
        k = i;
    end
end

% Estimated angle

TS = 0;
MS = 0;
%  k = 1
if k == 1
    for i = k:(k+1)
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
    
    %  k = K
elseif k == K
    for i = (k-1):k
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
    
    % 1 < k < K
elseif k > 1 && k < K
    for i = (k-1):(k+1)
        TS = TS + P(i)*PD_angle(i);
        MS = MS + P(i);
    end
end

est_angle = TS/MS;


end

