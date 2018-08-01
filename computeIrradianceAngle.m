function [ Dd, irr_angle, X, Y ] = computeIrradianceAngle( d, PD_angle )
% The function returns the distance from LED to the ith PD

CallParameters;

% Position of the ith PD

X_rb=[];
Y_rb=[];

for i=1:K
    X_rb = [X_rb R*cos(PD_angle(i))];
    Y_rb = [Y_rb R*sin(PD_angle(i))];
end

X = X_rb;
Y = Y_rb;

% The distance from LED to the ith PD

D=[];
for i=1:K
    D= [D sqrt(abs(d+X_rb(i))^2+(h-Y_rb(i))^2)];
end
Dd = D;

% The angle from the ith PD

angle=[];
for i=1:K
    angle =[angle atan(abs(d+X_rb(i))/(h-Y_rb(i)))];
end
irr_angle = angle;

end

