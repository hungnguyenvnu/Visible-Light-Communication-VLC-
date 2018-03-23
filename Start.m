close all;
clear all;
clc;
%% Input Parameters
InputParameters;
CallParameters;

%% Tao mang LED
x_LED = [1 4 7 10];


%% Tao Photodiode Array
PD_angle = createPhotodiodeArray();

%% Khoi tao mang luu vi tri cua rb
exact_x_rb =[];                              % tao mang cac vi tri chinh xac (input)cua rb de plot
% delta_x = [];                               % tao mang cac sai lech giua vi tri chinh xac va vi tri uoc luong cua rb
% d_max = h*tan(irr_max);

for x_rb = 0:0.05:200                      % Cho rb chay tu vi tri 0 den 10m
    %% Tao cac mang khoi tao
    
    exact_x_rb =[exact_x_rb x_rb];          % cong them phan tu vi tri cua Robot sau moi vong lap
    x_location =[];                         % tao mang rong de luu vi tri uoc luong cua robot sau moi vong lap.
    est_angle = [];                         % tao mang rong de luu goc uoc luong sau moi vong lap
    x_LED_joint = [];                       % tao mang rong de luu vi tri cua cac den LED (robot nam trong vung bao phu cua nhung led nay)
    %     est_angle_min = pi/2-irr_max;
    
    %% Loc ra cac den LED ma robot nam trong vung bao phu.
    % Cac den Led phai thoa man khoang cach tu rb den tam den LED phai nho hon
    % khoang cach giua 2 den LED. nhu vay length(x_LED_joint) lon nhat = 2
    
    for i=1:length(x_LED)
        if abs(x_rb-x_LED(i))<3                         % K/c giua 2 den LED = 3m
            x_LED_joint = [x_LED_joint x_LED(i)];
        end
    end
    x_LED_joint;
    
    %% Tinh cac goc uoc luong ung voi cac den LED ma rb nam trong vung bao phu cua chung
    
    for i= 1:length(x_LED_joint)                     % kich thuoc lon nhat cua est_angle = 2
        temp = computeEstAngle(x_rb,x_LED_joint,PD_angle,i);
        est_angle = [est_angle temp];
    end
    est_angle;                                       % Tra ra mang gia tri cua cac goc uoc luong
    
    %% Tinh cac vi tri uoc luong theo cac goc uoc luong
    
    for i=1:length(est_angle)
        temp_location = computeLocation(est_angle,x_LED_joint,i);
        x_location = [x_location temp_location];
    end
    x_location;
    
    %% Tinh trung binh vi tri cua rb
    
    sum = 0;
    for i = 1:length(x_location)
        sum = sum + x_location(i);
    end
    x_avg = sum/length(x_location);
    
    %% Tinh do lech giua vi tri uoc luong va vi tri chinh xac cua rb
    delta_x = (x_avg-x_rb)+0.01
    %     delta_x = [delta_x abs(x_avg - x_rb)];
    
end
delta_x;

%% ve do thi do chenh lech khoang cach
delta_x
exact_x_rb;
plot (exact_x_rb, delta_x, '--rs','LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','g',...
    'MarkerSize',10)

%%


