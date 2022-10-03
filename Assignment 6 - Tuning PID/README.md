# Improved Particle Swarm Optimization and Ziegler-Nicols 1 on PID Tuning
This dir is belong to Control System class contains with Tuning PID with ZN1 and IPSO on motor system.

## Software
This program ran in Matlab
## IPSO Method
### Variables
`s = tf('s');` defines `s` as 'frequency domain' for transfer function and will be used further. 
```
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
```
Those variable comes from BLDC control system.
```
c1=2; c2=2; w_max = 1; w_min = 0.1; particles=50; iterations=100;
var=3; e_max = 1; e_min=0.1;

% Search limit
lim_min = 0;
lim_max = 2500;
```
Variable above is the constant for PSO tuning.


### Testing 
#### ITAE Cost Function
![itae](https://user-images.githubusercontent.com/77116615/191751929-89ff2f77-7e1a-45a4-b535-f8f3a768ecc6.png)

#### Step Response
![step](https://user-images.githubusercontent.com/77116615/191751960-eee905b9-e450-41de-8824-f2157e431238.png)

#### Ramp Response
![ramp](https://user-images.githubusercontent.com/77116615/191752006-63e2fe9b-69ad-48eb-881d-7adb2b630819.png)

#### Impulse Response
![impulse](https://user-images.githubusercontent.com/77116615/191752036-5e05bfd7-9448-437e-ada6-16d9744b1b89.png)

#### Acceleration Response
![acceleration](https://user-images.githubusercontent.com/77116615/191752086-4f392de0-202b-429c-adc9-0935d10275b5.png)

### Results
Elapsed time is 18.701024 seconds.

### Before PSO-PID
```
        RiseTime: 1.0161
    SettlingTime: 1.8471
     SettlingMin: 0.0819
     SettlingMax: 0.0907
       Overshoot: 0
      Undershoot: 0
            Peak: 0.0907
        PeakTime: 3.0168
         SSError: 0.9095
```
### After PSO-PID
Kp = 853.3161

Ki = 74.1078

Kd = 2.4810e+03
```
        RiseTime: 9.5287e-04
    SettlingTime: 0.0012
     SettlingMin: 0.9949
     SettlingMax: 0.9976
       Overshoot: 0
      Undershoot: 0
            Peak: 0.9976
        PeakTime: 0.0036
         SSError: 0.0024
       DelayTime: 0.000595
```
## ZN1 Method
### Variables
`s = tf('s');` defines `s` as 'frequency domain' for transfer function and will be used further. 
```
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
```
Those variable comes from BLDC control system.
```
tic
timeVal=tic;
[y,t] = step(motor);
h = mean(diff(t));
dy = gradient(y, h);                                            % Numerical Derivative
[~,idx] = max(dy);                                              % Index Of Maximum
b = [t([idx-1,idx+1]) ones(2,1)] \ y([idx-1,idx+1]);            % Regression Line Around Maximum Derivative
tv = [-b(2)/b(1); (1-b(2))/b(1)];                               % Independent Variable Range For Tangent Line Plot
f = [tv ones(2,1)] * b;                                         % Calculate Tangent Line

L = tv(1);
T = tv(2);

figure(1)
plot(t, y)
hold on
plot(tv, f, '-r')                                               % Tangent Line
plot(t(idx), y(idx), '.r')
title('Mencari tangent line plant ')% Maximum Vertical
hold off
grid
```
Process above is to find tangent line and L and T constant

After L and T constant is obtained, the values is used to obtained Kp, Ki, and Kd constant
```
control = tf(zeros(1,1,5));
sys=tf(zeros(1,1,5));
complete=tf(zeros(1,1,5));

% sistem dengan P
kp = T/L
control(:,:,1)= tf([0 kp 0],[1 0]);

% sistem dengan PI
kp = 0.9*T/L
Ti= L/0.3;
ki = kp/Ti
control(:,:,2)= tf([0 kp ki],[1 0]);

% sistem dengan PID
kp = 1.2*T/L
Ti= 2*L;
ki = kp/Ti
Td = 0.5*L;
kd = kp*Td
control(:,:,3)= tf([kd kp ki],[1 0]);
```

### Testing 

#### Step Response


#### Ramp Response


#### Impulse Response


#### Acceleration Response


### Results
Elapsed time is 0.065802 - 0.455767 seconds.

### Before ZN1-PID
```
        RiseTime: 1.0161
    SettlingTime: 1.8471
     SettlingMin: 0.0819
     SettlingMax: 0.0907
       Overshoot: 0
      Undershoot: 0
            Peak: 0.0907
        PeakTime: 3.0168
         SSError: 0.9095
```
### After ZN1-PID
Control P:
  Kp = 140.9417
Control PI:
  Kp = 126.8475 ; Ki = 711.9513
Control PID:
  Kp = 169.13; Ki = 1.5821e+03; Kd = 4.5201
```
        RiseTime: 0.0676
    SettlingTime: 0.8486
     SettlingMin: 0.8129
     SettlingMax: 1.4349
       Overshoot: 43.4944
      Undershoot: 0
            Peak: 1.4349
        PeakTime: 0.17391
         SSError: -0.0021
       DelayTime: 0.0444
```

## Notes
Contact nanda.r.d@mail.ugm.ac.id for more information
## Links
You can access the source code here
[github.com/nandard/control-system.git](https://github.com/nandard/control-system.git)
