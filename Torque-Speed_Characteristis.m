% Torque - Speed Characteristics of 3 Phase Induction Motor.

clc
clear all
close 

% Initializing the values.
Es = 100;               % Standstil rotor emf/phase (V)
Rs = 0.03;              % Standstil rotor resitance/phase (ohm)
Xs = 0.3;               % Standstil rotor reactance/phase (ohm)
Ns = 1000;              % Synchronus speed of motor (r.p.m)

% Calculation for observing Torque-Speed relation for different values of slip,
s = (0:1:100)/100;      % Slip
s(1)= 0.00001;          % Manually setting first value of slip

Nm = (1-s) * Ns;        % Mechanical Speed

T1 = zeros(1,101);
T2 = zeros(1,101);
T3 = zeros(1,101);

% Torque Calculation Original Rotor Resistance:
for i = 1:101
T1(i) = (3*s(i)*Es^2*Rs)/((2*pi*Ns)*((Rs^2)+(s(i)*Xs)^2));
end

% Torque Calculation 2 times Rotor Resistance:
Rs = 2*Rs;
for i = 1:101
T2(i) = (3*s(i)*Es^2*Rs)/((2*pi*Ns)*((Rs^2)+(s(i)*Xs)^2));
end

% Torque Calculation 4 times Rotor Resistance:
Rs = 4*Rs;
for i = 1:101
T3(i) = (3*s(i)*Es^2*Rs)/((2*pi*Ns)*((Rs^2)+(s(i)*Xs)^2));
end

% Plot Torque vs Speed:
plot(Nm,T1,'b');
hold on;
plot(Nm,T2,'r');
hold on;
plot(Nm,T3,'g');
title('Induction Motor Torque vs Speed Charateristic');
xlabel('Speed');
ylabel('Torque');
legend('For Original R','For 2 Times R','For 4 Times R');
grid on;
hold off;
