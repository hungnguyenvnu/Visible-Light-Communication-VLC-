function [ location ] = computeLocation( est_angle,x_LED,k )
%% Chuc nang: Tinh vi tri cua rb nam trong vung bao phu cua den LED thu k

global h;
% if est_angle(k) == 0 || est_angle(k) == pi        % case: khi rb nam cach LED 1 k/c dung bang k/c ung vs goc roi cuc dai
%      est_d = -h*cos(est_angle(k))*tand(58);       % (tuy nhien loai truong hop nay vi ta gia su la rb chi lay thong tin
% else                                              % tu 2 den LED cach no 1 khoang nho hon k/c giua 2 den LED(3m)

est_d = -h/tan(est_angle(k));                      % khi rb o ben trai thi d nhan gia tri am, khi rb o ben phai thi d nhan gia tri duong
% end

location = x_LED(k) + est_d;

end

