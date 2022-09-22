clc; clear all; close all
% system function
s = tf('s');
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

num_motor = [K];
den_motor = [J*L J*R+b*L R*b+K*K];
motor = tf(num_motor,den_motor);
motor_l = feedback(motor,1);
step(motor_l)
%step(motor_l/s);
%impulse(motor_l);
%step(motor_l/s^2);
hold on
stepinfo(motor_l)
[y,t] = step(motor_l);
ss_error = abs(1 - y(end))

tic
% Constant
c1=2; c2=2; w_max = 1; w_min = 0.1; particles=50; iterations=100;
var=3; e_max = 1; e_min=0.1;

% Search limit
lim_min = 0;
lim_max = 2500;

% imization steps
steps = 0;

% Initialization
for m=1:particles
    for n=1:var
        v(m,n)=0;
        x(m,n)=lim_min+rand*(lim_max-lim_min);
        xp(m,n)=x(m,n);
    end
    
    % Model Parameters
    Kp = x(m,1);
    Ki = x(m,2);
    Kd = x(m,3);
    
    % Simulation Model
    pid = tf([Kd Kp Ki],[0 1 0]);
    motor_cl = feedback(motor * pid, 1);
    y = step(motor_cl);
    
    % TIAE (Objective Function)
    total = 0;
    T = size(y);
    for t=1:T
        total=total+(t*abs(y(t)-1));
    end
    ITAE(m) = total;
end

% Find the best value
[prev_best, loc] = min(ITAE);
xg(1) = x(loc,1);
xg(2) = x(loc,2);
xg(3) = x(loc,3);

for i=1:iterations
    e = e_max - ((e_max - e_min)*i)/iterations;
    w = w_min + ((iterations - i)*(w_max - w_min))/iterations;
    for m=1:particles
        for n=1:var
            v(m,n) = w*v(m,n) + c1*rand*(xp(m,n)-x(m,n)) + c2*rand*(xg(n)-x(m,n));
            x(m,n) = x(m,n) + e*v(m,n);
            % Constrain
            if x(m,n) < lim_min
                x(m,n) = lim_min;
            end
            if x(m,n) > lim_max
                x(m,n) = lim_max;
            end
        end
        
        % Update Personal Best
        Kp = x(m,1);
        Ki = x(m,2);
        Kd = x(m,3);
        pid = tf([Kd Kp Ki],[0 1 0]);
        motor_cl = feedback(motor * pid, 1);
        y = step(motor_cl);
        
        total = 0;
        T = size(y);
        for t=1:T
            total=total+(t*abs(y(t)-1));
        end
        ITAEp(m) = total;
        if ITAEp(m) < ITAE(m)
            ITAE(m) = ITAEp(m);
            xp(m,1) = x(m,1);
            xp(m,2) = x(m,2);
            xp(m,3) = x(m,3);
        end
    end
    % Update Global best
    [now_best, loc] = min(ITAE);
    if now_best < prev_best
        prev_best = now_best;
        xg(1) = xp(loc,1); % actually this can change to x(loc,n)
        xg(2) = xp(loc,2);
        xg(3) = xp(loc,3);
    end
    steps = steps + 1;
    best_value(steps) = prev_best;
end
toc
% Final Testing
ITAE_min = prev_best
Kp = xg(1)
Ki = xg(2)
Kd = xg(3)

pid = tf([Kd Kp Ki],[0 1 0]);
motor_cl = feedback(motor * pid, 1);
step(motor_cl)
%step(motor_cl/s);
%impulse(motor_cl);
%step(motor_cl/s^2);
legend("Before Tuning","After tuning");
title("Step Response");
stepinfo(motor_cl)
[y,t] = step(motor_cl);
ss_error = abs(1 - y(end))

t = 1:steps;
figure
plot(t,best_value, 'r--','LineWidth',2);
xlabel('Iteration');
ylabel('Cost Function (ITAE)');
legend("ITAE for PSO-PID");
title("ITAE with each iteration")
