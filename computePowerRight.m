function [ power ] = computePowerRight( d,PD_angle )
%% Chuc nang: Ham se tinh gia tri cong suat khi robot o ben phai cua den LED

CallParameters;

%% Tinh goc roi den PD thu i (irr_angle)

Dd = [];
irr_angle = [];
X = [];
Y = [];

[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle);  % Tinh goc den cua PD thu i

%% Tinh goc toi cua anh sang tai PD thu i

in_angle = [];
for i=1:K              %K la so PD
    % Xet dieu kien PD thu i phai co goc roi (irr_angle) nho hon goc nua cong suat
    if irr_angle(i) < irr_max && irr_angle(i) >0
        in_angle = [in_angle abs(atan((h-Y(i))/abs(d+X(i)))-(pi-PD_angle(i)))];     % thay doi cach tinh goc
    elseif irr_angle(i)==0
        in_angle = [in_angle 0];
    else
        in_angle = [in_angle pi/2];                          % Khi thay vao cong thuc tinh H0 thi cos(in_angle) = cos(pi/2)=0 => P =0
    end
end

%% Tinh cong suat ung voi cac PD

in_angle;
P=[];
B = (m+1)*A*Ts*Gs/(2*pi);        % He so hang
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
