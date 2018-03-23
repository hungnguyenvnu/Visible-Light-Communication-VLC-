function [ PosEst, PosMea, Pk ] = ImplementEKF( xk_plus, zk_plus, Pk_plus,kdS, kdT)
%IMPLEMENTEKF Summary of this function goes here
%   Detailed explanation goes here
global b;
global setDl;
global setDr;
%% theory deviation of robot
dS_theo = (setDl+setDr)/2;
dT_theo = (setDr-setDl)/b;

%% Initting the KF variances
% Jacobian matrix of partial derivates of h to x
I = eye(3);
Hk = I;           % unit matrix

% Variance matrix of input noises
Qk = [0.01*4, 0
    0    , 0.01*4];

% Noise matrix of AOA measurement
Rk = zeros(3);
Rk(1,1)= 0.0228;            % the AOA measurement gives only x-axis information

%% Extended Kalman Filter
%% Prediction
xk_plus(3,1)
temp = xk_plus(3,1) + dT_theo/2
Uk = [ dS_theo*cos(temp)
    dS_theo*sin(temp)
    dT_theo]
xk_sub = xk_plus + Uk      % robot position at time(k+1)in Prediction phase
zk_sub = Hk*xk_sub         % theoretical measured value is computed at theoretical position of robot

% Jacobian matrix of partial derivates of f to x
Ak = [1, 0, -dS_theo*sin(temp)
    0, 1,  dS_theo*cos(temp)
    0, 0, 1]

% Jacobian matrix of partial derivates of f to w
Wk = [0.5*cos(temp)-0.5*dS_theo*sin(temp)/b, 0.5*cos(temp)+0.5*dS_theo*sin(temp)/b
    0.5*sin(temp)+0.5*dS_theo*cos(temp)/b, 0.5*sin(temp)-0.5*dS_theo*cos(temp)/b
    1/b      , -1/b]


Pk_sub = Ak*Pk_plus*Ak' + Wk*Qk*Wk';

%% Correction
temp = Hk * Pk_sub * Hk' + Rk

Kk = Pk_sub * Hk' * inv(temp)
xk_plus = xk_sub + Kk * (zk_plus - zk_sub);
Pk_plus = (I - Kk * Hk) * Pk_sub;
% End of EKF

%% Save data
PosEst = xk_plus;
PosMea = zk_plus;
Pk     = Pk_plus;

end


