close all;
clear all;
clc;
%% Generator
InputParameters;
CallParameters;

% Number of sampling
dLen = 200;

% Moved distance after every sampling interval (assume that robot move on x-axis only => setDl = setDr)
global setDl;                       % the moved of left wheel after the sampling interval [m]
setDl = 0.1;

global setDr;                       % the moved of right wheel after the sampling interval [m]
setDr = 0.1;

% Coeffience of Odometry noise to determine corvariance noise matrix Qk
kR = 0.1;
kL = 0.1;

% Generate the matrixes of robot's pose.
PosEst = zeros(3,1)            % the pose matrix of robot at Prediction and Correction phase.
PosMea = PosEst;            % the pose matrix of measurement phase
PosTru = PosEst;            % the pose matrix of true postion.

% Generate the temporarity matrixes of robot's pose.
PosE = zeros(3,1);            % the pose matrix of robot at Prediction and Correction phase.
PosM = PosE;            % the pose matrix of measurement phase
PosT = PosE;            % the pose matrix of true postion.

% Generate the first matrix of Pk
I = eye(3)
Pk = I;                  % the unit matrix.

%% Simulation
for i = 0:400
    % the moved distances of two wheels when are affected by noise
    sR = setDr + kR*randn;
    sL = setDl + kL*randn;
    
    % Process noise generate the true trajectory
    dS = (sR+sL)/2;                     % distance
    dT = (sR-sL)/b;                     % orientation
    
    temp = PosT(3,1) + dT/2;            % theta + delta_theta/2
    U = [dS*cos(temp)                   % moved distance x
        dS*sin(temp)                   % moved distance y
        dT];                           % delta_theta
    
    PosT = PosT + U;                    % Update true position of robot
    
    %% Compute error input
    kdS = 0.5*sqrt(kR^2+kL^2);
    kdT = sqrt(kR^2+kL^2)/b;
    
    % Compute EKF from: tempory pose, measured value
    %     PosE
    [PosE,PosM, Pk] = ImplementEKF(PosE,PosM,Pk, kdS, kdT);
    
    % The AOA measured value includes noises
    PosM = PosT + [sqrt(0.0228)*randn
        0
        0];
    %% Store data
    PosEst = [PosEst,PosE];
    PosMea = [PosMea,PosM];
    PosTru = [PosTru,PosT];
    
end

%% Plot data

scsz = get(0, 'ScreenSize');
%-- figure1
% figure('Position',[50, 150, scsz(3) - 100, 500]);
figure(1);
plot(PosEst(1,:), 'r--');
xlabel('Time (100 ms)');
ylabel('X coordinate (m)');
title ('Combined Plot');
hold on; grid on; zoom on;
plot(PosMea(1,:), 'g-+');
plot(PosTru(1,:), 'b--');
hleg = legend('Estimation','Measurement', 'True Posture');
set(hleg,'Location','NorthWest');
set(hleg,'Interpreter','none');
figure(2);
plot(abs(PosEst(1,:)-PosTru(1,:)), 'r--');
xlabel('Time (100 ms)');
ylabel('Deviation (m)');
title ('Deviation');
hold on; grid on; zoom on;
plot(abs(PosMea(1,:) - PosTru(1,:)), 'g-+')
hleg = legend('Estimation','Measurement');
set(hleg,'Location','NorthWest');
set(hleg,'Interpreter','none');


