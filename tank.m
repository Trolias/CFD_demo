clc ;
close all;
clear all;

%% Parameters

prompt = 'Give initial height of water:  ';
h0 = input(prompt);
prompr = "Give diameter of the tank:  ";
D = input(prompt);
rho = 1000;     % Water Density [kg/m^3]
g = 9.81;       % Gravity accelaration[m/s^2]
C = 0.001;      % valve coefficient [kg/(s*Pa)]

%% Derived Quantities

% exponantial time multiplier
k = 4*C*g/D^2/pi;
% time to reach half_empty tank
t_half = (pi*D^2*log(2)) / (4*C*g);
% time to reach empty state
t_empty = (pi*D^2*log(1000)) / (4*C*g);

%% Arrays for Solution Function
% time
t = linspace(0,t_empty,1001);
% Solution function
h = h0*exp(-k*t);

%%Plotting
figure(1)
plot(t,h)



