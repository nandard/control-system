## Tuning PID motor BLDC dengan ZN1

1. Inisialisasi Variabel sistem dan deklarasi TF Plant

![image](https://user-images.githubusercontent.com/99254988/192949758-baf9965a-23a2-493f-acab-4fb35e9f3648.png)

2. Mencari tangent line untuk mendapatkan T dan L

![image](https://user-images.githubusercontent.com/99254988/192950115-ff4b22de-0aca-407a-8e90-c895d13b521c.png)

Gambar tangent line

![image](https://user-images.githubusercontent.com/99254988/192950271-70e2eea0-534a-4af8-ad8e-9eefe50502f3.png)

3. Mencari nilai P, PI dan PID

![image](https://user-images.githubusercontent.com/99254988/192950443-817ff791-74fe-4160-8710-0408bb3de352.png)

4. Menentukan transfer function sistem dengan feeedback

![image](https://user-images.githubusercontent.com/99254988/192950569-d19bc10d-0124-4de2-8e25-06dc0cb32747.png)

5. Mencetak response setiap sistem (P,PI,PID)

Hasil step response

![image](https://user-images.githubusercontent.com/99254988/192950984-21c10f3c-c28b-40d6-ab87-dab6b291593f.png)

Hasil impulse response

![image](https://user-images.githubusercontent.com/99254988/192951019-82e38fe1-f97b-4fcc-919f-5c082d508581.png)

Hasil ramp response

![image](https://user-images.githubusercontent.com/99254988/192951061-fe65ddf9-c972-49b9-a8a4-a3516c8bcc65.png)

Hasil acceleration

![image](https://user-images.githubusercontent.com/99254988/192951106-aef58b94-c4be-46df-818c-dc5306e9636a.png)

6. Stepinfo sistem (P,PI,PID)

![image](https://user-images.githubusercontent.com/99254988/192951341-bf36fd2c-8bee-4e73-8d63-4ca330487734.png)
