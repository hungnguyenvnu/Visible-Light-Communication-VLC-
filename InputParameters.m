%-----------------Channel DC gain Parameters------------------------------%
global h;                           % Chieu cao den LED [m]
h = 3;

global irr_max;                     % Goc roi lon nhat cua den LED (goc nua cong suat) [rad]
irr_max = 58*pi/180;

global in_max;                      % Goc FOV cua PD [rad]
in_max = 45*pi/180;

global K;                           % PD numbers []
K = 17;

global R;                           % Ban kinh cua PD-array [m]
R = 0.05;

global A;                           % Detector physical of a PD [m2]
A = 1e-4;

global Ts;                          % gain of an optical filter []
Ts = 1;

global Gs;                          % optical concentrator gain []
Gs = 1;

global m;                           % he so Lembertain []
m = - log10(2)/log10(cos(irr_max));

global Pt;                          % cong suat phat cua den Led [W]
Pt = 0.02;

global H;                           % he so trong ham truyen H0
H = (m+1)*A*Ts*Gs/(2*pi);

global d_max;                       % K/c lon nhat tu rb den tam den LED
d_max = h*tan(irr_max);

%-----------------Noise Parameters----------------------------------------%

global q;                           % hang so Culong (C)
q = 1.60217657e-19;

global l;                           % detector responsivity [A/W]
l = 0.54;

global B;                           % Bandwidth = datarate trong truong hop dieu che OOK [B/s]
B = 100e6;

global Ibg;                         % dong dien background [A]
Ibg = 5100e-6;

global I2;                          % noise bandwidth factor [constant]
I2 = 0.562;

global Kb;                           % hang so Boltzmann
Kb = 1.3806488e-23;

global Tk;                          % nhiet do tuyet doi [K]
Tk = 300;

global n;                           % fix capacitance [F/m2]
n = 1.12e-6;                        %112e-12/1e-4

global F;                           % FET channel noise factor [constant]
F = 1.5;

global I3;                          % he so
I3 = 0.0868;

global Gm;                          % FET transconductance [S]
Gm = 30e-3;

global G;                           % open-loop voltage gain
G = 10;


%------------------------Kalman Filter Parameters-----------------%
global setDl;                       % the moved of left wheel after the sampling interval [m]
setDl = 0.1;

global setDr;                       % the moved of right wheel after the sampling interval [m]
setDr = 0.1;

global b;
b = 0.275;                          % distance of 2 wheels [m]
