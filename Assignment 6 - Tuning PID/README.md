# Derivative Effect on Control System
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
![itae](https://user-images.githubusercontent.com/77116615/191710404-8b5a9d09-9362-4ace-9185-530930ad2abd.png)

### Step Response
![Screenshot 2022-09-22 162423](https://user-images.githubusercontent.com/77116615/191710444-cfb6b03f-4e3c-4651-b775-1ae2c7cd17d0.png)

## Results
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
Kp = 853.2738
Ki = 73.5218
Kd = 2500
```
        RiseTime: 9.6110e-04
    SettlingTime: 0.0012
     SettlingMin: 0.9952
     SettlingMax: 0.9977
       Overshoot: 0
      Undershoot: 0
            Peak: 0.9977
        PeakTime: 0.0036
         SSError: 0.0024
```

### Notes
Contact nanda.r.d@mail.ugm.ac.id for more information
### Links
You can access the source code here
[github.com/nandard/control-system.git](https://github.com/nandard/control-system.git)
