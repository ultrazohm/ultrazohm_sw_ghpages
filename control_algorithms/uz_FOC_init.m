%% initialization script for uz_FOC
clc
clear
% motor parameters - Bühler 201
% Bühler Typ BLDC_1_25_058_201 %

d_I_n =8;                           % [A] rated current
d_V_n = 24;                         % [V] rated voltage
d_n_n = 3200;                       % [1/min] rated speed
d_R_ph_ph = 0.08*2;              % [Ohm] Stator phase to pahse resistance
d_L_ph_ph = 0.00027*2;              % [H] Anschlussinduktivität Phase-Phase
d_R_ph = d_R_ph_ph/2;               % [Ohm] Stator phase resitance
d_L_0  = 0;                         % Null-Sequenz Induktivitaet
d_L_ph = d_L_ph_ph/2;               % [H] Phase to phase inductivity
d_L_d = d_L_ph_ph/2;                % [H] d-Axes inductivity  
d_L_q = d_L_ph_ph/2;                % [H] q-Axes inductivity
d_p = 4;                            % Number of Polepairs
d_J_m = 0.00001773;                 % [kgm^2]inertia
d_psi_pm = 0.0082;               % [V*s] Permanent-Flux 


d_Kp_id=00.386;                     % [V/A] d-current controller P-Gain
d_Kp_iq=00.386;                     % [V/A] q-current controller P-Gain
d_Kp_n=0.0864;                      % [As/rad] speed controller P-Gain
d_Tn_id=0.002375;                   % [s] reset time of of d-current control integrator
d_Tn_iq=0.002375;                   % [s] reset time of of q-current control integrator
d_Tn_n=0.1;                         % [s] reset time of of speed control integrator



% Encoder------------------------------------------------------------------
% Kübler TYP 5802
d_incEncoder = 5000;              % Number of increments
d_J_Encoder = 1.8e-26;              % [kgm^2] encoder inertia

% coupling of  Testmotor and encoder-----------------------------------------
% RW BK5 300
d_J_Coupling_M_E = 2e-6;                  % [kgm^2*] coupling inertia
d_c_Coupling_M_E = 1500;                  % [Nm/rad] coupling stiffness 

% coupling of Testmotor and loadmachine-----------------------------------
% RW BK5 30
d_J_Coupling_M_Ms = 2e-20;                 % [kgm^2*] coupling inertia
d_c_Coupling_M_Ms = 1500;                  % [Nm/rad] coupling stiffness 

% coupling of measuringshaft and loadmachine-----------------------------------
% RW BK5 30

d_J_Coupling_Ms_L = 2e-6;                  % [kgm^2*] coupling inertia
d_c_Coupling_Ms_L = 1500;                   % [Nm/rad] coupling stiffness


% measuring shaft----------------------------------------------------------
% simplified as long torsion shaft of one diameter

d_l_Ms=0.5;                                                                   % [m] length
d_d_Ms=0.016;                                                                 % [m] diameter
d_G_Ms=8*(10^10);                                                             % [N/(m^2)] Shear modulus of steel
d_rho_Ms=7860;                                                                % [g/(m^3)] Density of steel
d_J_Ms_M = 0.5*0.5*((0.5*d_d_Ms)^4)*3.14*d_l_Ms*d_rho_Ms;                     % [kgm^2] inertia loadside of measuringshaft
d_J_Ms_L =d_J_Ms_M;                                                           % [kgm^2] inertia of motorside of measuringshaft
d_c_Ms = d_G_Ms*3.14*(d_d_Ms^4)/(32*d_l_Ms);                                  % [Nm/rad] stiffness of measuringshaft

% Loadmachine--------------------------------------------------------------
d_J_Loadmachine = 28e-6;                 % [kgm^2] Loadinertia
d_J_Loaddisc = 0.00000679;             % [kgm^2] Loadinertia of additional loaddisc

%  Friction----------------------------------------------------------------
d_M_stribeck = 0.02;                     % [Nm] Stribeck Friction Torque
d_v_stribeck = 1e-18;                    % [rad/s] Stribeck speed
d_d_viscous  = 0.0001963;                % [Nms/rad] Viscous friction torque constant
d_M_coulomb = 0.01056;                   % [Nm] Coloumb Friction Torque


%Simplification as two mass system

d_J_Motorside = d_J_Encoder + d_J_m  + d_J_Coupling_M_E+d_J_Coupling_M_Ms+d_J_Ms_M;    % [kgm^2]Total loadinertia
d_J_Loadside =   d_J_Ms_L+d_J_Loadmachine + d_J_Coupling_Ms_L;                     % [kgm^2]Total motorinertia
d_c_TMS = d_c_Ms;                                                                                % [Nm/rad] Stiffness of two mass system
d_d_TMS=0.005;   

% Alternative calculation for damping
%d_kd = 0.05;                           % Damping constant for steel
%d_d_TMS = (2*d_kd*d_c_TMS)/sqrt(d_c_TMS*(d_J_Antriebseite+d_J_Lastseite)/(d_J_Antriebseite*d_J_Lastseite)); 




Reset = 0;

% Simulation für constante Drehzahl
d_omega_mech=(2000/60)*2*pi;%2000rpm
polePairs = 4;

% Controlparameter
f_c=20000;   %Hz UZ-ISR-frequency
t_a = 1/f_c;
d_d_c=16000;                %kHz
d_y_max=1000;                %V
d_y_min=-d_y_max;           %V

% Auslegung des Stromreglers nach Betragsoptimum
d_tau_sigma=2/16000;          %Verzögerungszeit des Zeitdiskreten Systems
Kp_id=4;%d_L_d/(2*d_tau_sigma);
Kp_iq=5;%d_L_q/(2*d_tau_sigma);
Ki_id=6;%d_R_1/(2*d_tau_sigma);
Ki_iq=Ki_id;
Kp_n=2;
Ki_n=3;

%Parameter
n_ref_rpm=2000; %target speed for speedFOC
U_ZK=24; %V
