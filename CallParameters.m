%%-----------------Channel DC gain Parameters------------------------------%
global h;                           % Chieu cao den LED [m]
global irr_max;                     % Goc roi lon nhat cua den LED (goc nua cong suat) [rad]
global in_max;                      % Goc FOV cua PD [rad]
global K;                           % PD numbers []
global R;                           % Ban kinh cua PD-array [m]
global A;                           % Detector physical of a PD [m2]
global Ts;                          % gain of an optical filter []
global Gs;                          % optical concentrator gain []
global m;                           % he so Lembertain []
global Pt;                          % cong suat phat cua den Led [W]
global H;                          % he so trong ham truyen H0
global d_max;

%%-----------------Noise Parameters----------------------------------------%
global q;                           % hang so Culong (C)
global l;                       % detector responsivity [A/W]
global B;                           % Bandwidth = datarate trong truong hop dieu che OOK [MB/s]
global Ibg;                         % dong dien background [A]
global I2;                          % noise bandwidth factor [constant]
global Kb;                          % hang so Boltzmann
global Tk;                          % nhiet do tuyet doi [K]
global n;                           % fix capacitance [F/m2]
global F;                           % FET channel noise factor [constant]
global I3;                          % he so
global Gm;                          % FET transconductance [S]
global G;                           % open-loop voltage gain

