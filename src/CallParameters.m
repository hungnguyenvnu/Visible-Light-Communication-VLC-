%%-----------------Channel DC gain Parameters------------------------------%
global h;                           % The height to LED [m]
global irr_max;                     % The maximum irr angle [rad]
global in_max;                      % Angle FOV of PD [rad]
global K;                           % PD numbers []
global R;                           % Radius of PD-array [m]
global A;                           % Detector physical of a PD [m2]
global Ts;                          % gain of an optical filter []
global Gs;                          % optical concentrator gain []
global m;                           % Lembertain []
global Pt;                          % Power of Led [W]
global H;                          % Transfer function H0
global d_max;

%%-----------------Noise Parameters----------------------------------------%
global q;                           %  Culong Constant(C)
global l;                           % detector responsivity [A/W]
global B;                           % Bandwidth = datarate in OOK [MB/s]
global Ibg;                         % background [A]
global I2;                          % noise bandwidth factor [constant]
global Kb;                          % Boltzmann
global Tk;                          % kelvin [K]
global n;                           % fix capacitance [F/m2]
global F;                           % FET channel noise factor [constant]
global I3;                          % 
global Gm;                          % FET transconductance [S]
global G;                           % open-loop voltage gain

