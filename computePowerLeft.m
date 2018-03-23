function [ Power ] = computePowerLeft( d,PD_angle )
%% Chuc nang: Ham se tinh gia tri cong suat khi robot o ben trai cua den LED va khi rb nam ngay duoi chan den LED

CallParameters;

%% Tinh goc roi den PD thu i (irr_angle)

Dd = [];
irr_angle = [];
X = [];
Y = [];

[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle);

%% Tinh goc toi cua anh sang tai PD thu i

in_angle = [];
for i=1:K
    % Xet dieu kien PD thu i phai co goc roi (irr_angle) nho hon goc nua cong suat
    if irr_angle(i) < irr_max && irr_angle(i) >0
        in_angle = [in_angle abs(atan((h-Y(i))/abs(d+X(i)))-PD_angle(i))];
        % Xet dieu kien goc roi (irr_angle) den PD thu i = 0 (tuc la rb nam
        % ngay duoi chan den LED
    elseif irr_angle(i)==0
        in_angle = [in_angle 0];
        % Khi goc roi (irr_angle) khong thoa man cac dieu kien tren
    else
        in_angle = [in_angle pi/2];                                 % Khi thay vao cong thuc tinh H0 thi cos(in_angle) = cos(pi/2)=0 => P =0
    end
end

%% Tinh cong suat ung voi cac PD

P=[];
% B = (m+1)*A*Ts*Gs/(2*pi);        % He so hang
for i=1:K
    if in_angle(i) < in_max && in_angle(i) >=0                  % Bao gom truong hop khi rb o duoi chan den LED, khi do in_angle(pi/2) = 0
        temp = Pt*H*(cos(irr_angle(i))^m)*cos(in_angle(i))/(Dd(i)^2);
    else
        temp = 0;
    end
    P = [P temp];
end
Power = P;

end

