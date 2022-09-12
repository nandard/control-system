% Variable
s = tf('s');
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

Kp = 1;
% Ki = 1;
% Ki = 3;
% Ki = 5;
 Ki = 7;
% Ki = 9;

% Define Transfer Function
num_motor = [K];
den_motor = [J*L J*R+b*L R*b+K*K];

motor = tf(num_motor,den_motor)
% Define Control Function
C = tf([Kp Ki],[1 0])
% Define Closed-Loop function
complete = feedback(motor*C,1);
% Process system responses
subplot(311), impulse(complete);   % Impulse reponse
subplot(312), step(complete);      % Step Response
subplot(313), step(complete / s);  % Ramp response
stepinfo(complete)
% Calculate the Stead-State Error
[y,t] = step(complete); % Calculate Steady-State error
sse = abs(1 - y(end))
% Limit the graph
xlim([0 50])
ylim([0 3])