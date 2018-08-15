function [ location ] = computeLocation( est_angle, x_LED, k)

% Find the position of robot in the cover area of the kth LED

global h;

est_d = -h/tan(est_angle(k));   % Robot is on the left: d < 0, robot is on the right: d > 0

location = x_LED(k) + est_d;

end

