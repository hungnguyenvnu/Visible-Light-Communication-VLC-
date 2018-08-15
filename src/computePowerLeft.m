function [ Power ] = computePowerLeft( d,PD_angle )
% Function returns the power when robot is on the left of LED 

CallParameters;

Dd = [];
irr_angle = [];
X = [];
Y = [];

[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle);


in_angle = [];
for i=1:K
	% The ith PD has the angle is smaller than angle of half power
    if irr_angle(i) < irr_max && irr_angle(i) >0
        in_angle = [in_angle abs(atan((h-Y(i))/abs(d+X(i)))-PD_angle(i))];
    elseif irr_angle(i)==0
        in_angle = [in_angle 0];
    else
        in_angle = [in_angle pi/2];
    end
end

% The power corresponding with PD

P=[];

for i=1:K
    if in_angle(i) < in_max && in_angle(i) >=0           
        temp = Pt*H*(cos(irr_angle(i))^m)*cos(in_angle(i))/(Dd(i)^2);
    else
        temp = 0;
    end
    P = [P temp];
end
Power = P;

end

