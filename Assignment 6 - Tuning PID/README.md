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

### Notes
Contact nanda.r.d@mail.ugm.ac.id for more information
### Links
You can access the source code here
[github.com/nandard/control-system.git](https://github.com/nandard/control-system.git)
