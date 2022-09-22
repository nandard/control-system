# Improved Particle Swarm Optimization on PID Tuning
This dir is belong to Control System class contains with Tuning PID with ZN1 and PSO on motor system.

## Software
This program ran in Matlab

## Variables
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


## Testing 
### ITAE Cost Function
![itae](https://user-images.githubusercontent.com/77116615/191751929-89ff2f77-7e1a-45a4-b535-f8f3a768ecc6.png)

### Step Response
![step](https://user-images.githubusercontent.com/77116615/191751960-eee905b9-e450-41de-8824-f2157e431238.png)

### Ramp Response
![ramp](https://user-images.githubusercontent.com/77116615/191752006-63e2fe9b-69ad-48eb-881d-7adb2b630819.png)

### Impulse Response
![impulse](https://user-images.githubusercontent.com/77116615/191752036-5e05bfd7-9448-437e-ada6-16d9744b1b89.png)

### Acceleration Response
![acceleration](https://user-images.githubusercontent.com/77116615/191752086-4f392de0-202b-429c-adc9-0935d10275b5.png)

## Results
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
```

### Notes
Contact nanda.r.d@mail.ugm.ac.id for more information
### Links
You can access the source code here
[github.com/nandard/control-system.git](https://github.com/nandard/control-system.git)
