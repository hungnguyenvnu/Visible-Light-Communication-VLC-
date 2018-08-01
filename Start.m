close all;
clear all;
clc;
%% Input Parameters
InputParameters;
CallParameters;

%% LED array
x_LED = [1 4 7 10];


%% Photodiode Array
PD_angle = createPhotodiodeArray();

%% Arry for position of robot
exact_x_rb =[];                             


for x_rb = 0:0.05:200                      
    %Initial array
    
    exact_x_rb =[exact_x_rb x_rb];          
    x_location =[];                         
    est_angle = [];                        
    x_LED_joint = [];                 
    
    for i=1:length(x_LED)
        if abs(x_rb-x_LED(i))<3                     
            x_LED_joint = [x_LED_joint x_LED(i)];
        end
    end
    x_LED_joint;
    
    
    for i= 1:length(x_LED_joint)                   
        temp = computeEstAngle(x_rb,x_LED_joint,PD_angle,i);
        est_angle = [est_angle temp];
    end
    est_angle;                                
    
    
    for i=1:length(est_angle)
        temp_location = computeLocation(est_angle,x_LED_joint,i);
        x_location = [x_location temp_location];
    end
    x_location;
    
    
    sum = 0;
    for i = 1:length(x_location)
        sum = sum + x_location(i);
    end
    x_avg = sum/length(x_location);
    

    delta_x = (x_avg-x_rb)+0.01;
  
    
end
delta_x;

%
delta_x
exact_x_rb;
plot (exact_x_rb, delta_x, '--rs','LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','g',...
    'MarkerSize',10)

%%


