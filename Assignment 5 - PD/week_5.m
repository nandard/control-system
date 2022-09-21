s = tf('s');
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

Kp = 1;
%Kd = 1;
%Kd = 3;
%Kd = 5;
%Kd = 7;
Kd = 9;
    
num_motor = [K];
den_motor = [J*L J*R+b*L R*b+K*K];
motor = tf(num_motor,den_motor)

C = tf([Kd Kp 0],[0 1 0])

complete = feedback(motor*C,1);

subplot(311), impulse(complete);   % Impulse reponse
subplot(312), step(complete)      % Step Response
subplot(313), step(complete / s);  % Ramp response
title("Ramp Response");
stepinfo(complete)

[y,t] = step(complete); % Calculate Steady-State error
sse = abs(1 - y(end))

xlim([0 3])
ylim([0 3])