function [ est_angle] = computeEstAngle( x_rb,x_LED,PD_angle,k)
% Tinh goc uoc luong khi rb nam duoi vung bao phu cua den LED thu k

%% Tinh goc roi den PD thu i

d = x_rb-x_LED(k);
[Dd irr_angle X Y]=computeIrradianceAngle(d,PD_angle);
% Tra ra cac ma tran:
% Dd: K/c tu den LED den PD thu i
% irr_angle: goc roi cua LED den PD thu i
% X,Y: Toa do cua PD thu i


%% Tinh cong suat nhan duoc tai cac PD
% Chia lam 2 truong hop: rb nam ben trai va ben phai cua den LED
% Vi khi rb nam o 2 ben thi cong thuc tinh goc den cua anh sang se khac
% nhau

global d_max;
P = [];
N = [];
if x_rb>=(x_LED(k)-d_max) && x_rb<= x_LED(k)            % dk: robot phai nam trong vung bao phu ben trai cua den LED
    P = computePowerLeft(d,PD_angle);
elseif x_rb >x_LED(k) && x_rb <= (x_LED(k)+d_max)       % dk: robot phai nam trong vung bao phu ben phai cua den LED
    P = computePowerRight(d,PD_angle);
end
hik = P
%% Tinh cong suat khi co nhieu
N = computeNoise(P)
for i=1:length(P)
    temp = P(i)+ N(i);
    P(i) = temp;
end

%
% %% Loai nhung gia tri P<0
% for i = 1:length(P)
%     if P(i)<0
%         P(i)=0;
%     end
% end
P
%% Tinh cong suat theo dBm (khong can thiet)
% Khi Pt = 0.02 W, P_dBm tai receiver khoang -50dBm -> -40dBm

% P_dBm= [];
% for i=1:length(P)
%     P_dBm = [P_dBm 10*log10(P(i)*1e3)];
% end

%% Tinh goc uoc luong
est_angle = computeWeight(P,PD_angle);                  % Tinh goc uoc luong tu cac cong suat nhan duoc tai cac PD

end

