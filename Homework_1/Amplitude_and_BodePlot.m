%
clear
clc
syms t
Output1(t) = cos(1000*pi*t)+cos(3000*pi*t)
Output2(t) = 0.2234*cos(1000*pi*t)+0.0076*cos(3000*pi*t)
ezplot(Output1(t),[0,1,-1,1])
hold on
ezplot(Output2(t),[0,1,-1,1])
%