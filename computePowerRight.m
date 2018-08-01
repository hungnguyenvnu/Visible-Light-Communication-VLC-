function [ power ] = computePowerRight( d, PD_angle )
% Function return power when robot is on the right of LED

CallParameters;

Dd = [];
irr_angle = [];
X = [];
Y = [];

[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle); 


in_angle = [];

for i=1:K         
    % The ith PD (irr_angle)  < The half power angle
    if irr_angle(i) < irr_max && irr_angle(i) >0
        in_angle = [in_angle abs(atan((h-Y(i))/abs(d+X(i)))-(pi-PD_angle(i)))];     
    elseif irr_angle(i)==0
        in_angle = [in_angle 0];
    else
        in_angle = [in_angle pi/2];                       
    end
end

% The power corresponding with PD

in_angle;
P=[];
B = (m+1)*A*Ts*Gs/(2*pi);      
for i=1:K
    if in_angle(i) < in_max && in_angle(i) >=0
        temp = Pt*B*(cos(irr_angle(i))^m)*cos(in_angle(i))/(Dd(i)^2);
    else
        temp = 0;
    end
    P = [P temp];
end
power = P;

end
