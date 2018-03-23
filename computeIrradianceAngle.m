function [ Dd, irr_angle,X,Y ] = computeIrradianceAngle( d,PD_angle )
% Ham tra ve ket qua bao gom khoang cach tu LED den PD thu i va goc roi den
% PD thu i va vi tri cua PD thu i

CallParameters;
%% Tinh vi tri cua PD thu i

X_rb=[];
Y_rb=[];
for i=1:K
    X_rb = [X_rb R*cos(PD_angle(i))];
    Y_rb = [Y_rb R*sin(PD_angle(i))];
end
X = X_rb;
Y = Y_rb;

%% Tinh khoang cach tu den LED den PD thu i

D=[];
for i=1:K
    D= [D sqrt(abs(d+X_rb(i))^2+(h-Y_rb(i))^2)];
end
Dd = D;

%% Tinh goc roi den PD thu i

angle=[];
for i=1:K
    angle =[angle atan(abs(d+X_rb(i))/(h-Y_rb(i)))];
end
irr_angle = angle;

end

