# routh_table
This repo is belong to Control System class contains with Automated Routh Table Calculator based on Python. This code 100% original made by my hand :), please leave some notes if you're going to use it. Thanks!

## Libraries
Libraries that used in this program is ```numpy``` and ```pandas```. ```numpy``` works by define and perform array while ```pandas``` is the final form after ```numpy.array``` to simplify the presentation. They imported by write 
```
import numpy as np
import pandas as pd
```

## RouthStability Class
This class contains lots of procedures to simplify our Routh Stability Table Generator process. 
```
def __init__(self, den):
    self.den = np.array([float(item) for item in den.split()])
    self.deg = len(self.den)
```
The constructor ```__init__``` takes string of coefficiens from polynomial, extract the number, and load into class variable. It also define ```self.deg``` variable to save array's length, reducing number of calling ```len()``` function

```
def set_k(self, k):
    self.den = np.append(self.den, float(k))
    self.deg += 1
```
This function only takes one number from user and append it to ```self.den``` which defined as gain (constant). Also ```self.deg``` will increase by one

```
def calc_routh(self):
    height = (self.deg+1)//2
    arr = np.zeros((height + 2,height))
    for index in range(self.deg):
        if index % 2 == 0:
        arr[0][index//2] = self.den[index]
        else:
        arr[1][(index-1)//2] = self.den[index]

    for i in range(2, height+2):
        for j in range(height-1):
        arr[i][j] = (arr[i-1][0]*arr[i-2][j+1] - arr[i-2][0]*arr[i-1][j+1])//2
        arr[i][j] += 0

    self.df = pd.DataFrame(arr)
    self.show_tab()
    if self.is_stable() == True:
        print("SYSTEM IS STABLE")
    else:
        print("SYSTEM IS UNSTABLE")
```
```calc_routh(self)``` as the core process of this class contains initialization and process about Routh Stability Process. Firstly, it define an empty zero (basically it filled with zeros) and iteratively being inserted by ```self.den``` (refering to Routh Table principle). After that, each cell will be updated by calculating Routh Table formula 

$arr_{i,j}=\frac{arr_{i-1][0]*arr[i-2][j+1]-arr[i-2][0]*arr[i-1][j+1]}{arr_{i-1][0]}$/