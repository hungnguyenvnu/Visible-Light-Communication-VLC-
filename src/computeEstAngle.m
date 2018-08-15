function [ est_angle] = computeEstAngle( x_rb,x_LED,PD_angle,k)

% Function returns the estimated angle when robot is under the kth LED

d = x_rb-x_LED(k);
[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle);

global d_max;
P = [];
N = [];
% Robot is under the left cover area of LED
if x_rb>=(x_LED(k)-d_max) && x_rb<= x_LED(k) 
    P = computePowerLeft(d,PD_angle);
% Robot is under the right cover area of LED
elseif x_rb >x_LED(k) && x_rb <= (x_LED(k)+d_max)
    P = computePowerRight(d,PD_angle);
end
hik = P

% The power with noise
N = computeNoise(P)
for i=1:length(P)
    temp = P(i)+ N(i);
    P(i) = temp;
end

% Estimate the angle
est_angle = computeWeight(P,PD_angle);

end

