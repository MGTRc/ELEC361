%---------------------------%
% Mete Can GAZI - 141024020 %
%---------------------------%
clc 
clear

%PARAMETERS%
fs = 10^6;              %Sample Rate
fc = 200;               %Freq. of Carrier
fm = 10;                %Freq. of Message
Kf = 100;               %Freq. Sensivity
A  = 0.25;              %Amp. of Message

%CALCULATIONS%
BetaKf = (A*Kf)/fm; 
t = (0:fs-1)*(1/fs);
s = cos((2*pi*fc*t)+(BetaKf*sin(2*pi*fm*t)));
fftsignal = fftshift(fft(s))/fs;
f = (-fs/2:fs/2-1);

n=5;
bessel = (1/2)*besselj(0:n,BetaKf);
C_Bessel = zeros(1,(2*n+1));

holder_1 = 1;
for i=(n+1):(2*n+1)
    C_Bessel(i) = bessel(holder_1);
    holder_1 = holder_1 + 1;
end

holder_2 = n+1;
for j=1:(n)
    C_Bessel(j) = bessel(holder_2);
    holder_2 = holder_2 - 1;
end

C_Freq = (fc-n*fm):fm:(fc+n*fm);

%GRAPHS%
figure;
plot(t,s);
axis([0 0.1 -1.5 1.5]);
title('FM Signal for A = 0.25 , Kf = 100');
grid on;

figure;
plot(f,abs(fftsignal));
axis([-2*fc 2*fc 0 0.55]);
title('Spectrum for A = 0.25 , Kf = 100');
grid on;

figure;
plot(f,abs(fftsignal),C_Freq , C_Bessel, 'o');
axis([0 2*fc -0.1 0.55]);
title('Spectrum Points for A = 0.25 , Kf = 100');
grid on;