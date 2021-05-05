
clc
clear all
close all
%initialising range spaces of x and y
g = 0:0.001:1-0.001;
[x,y]=meshgrid(g); %storing coordinates as a grid

cond = (y <= x);   %storing values x>y   if y>x value stored will be zero
cond = double(cond); %converting it into matrix so that we can access each element
cond(cond == 0) = NaN; % removing all zero values
 
f = 8*x.*y;
f_plot = f.*cond; %applying condition to the function

figure(1)
surf(g,g,f_plot)
xlabel('X');
ylabel('Y');
zlabel('f(x,y)');


title("Joint pdf f(x,y)");

marg_y=(4*g)-(4*g.^3);%marginal of y
z = bsxfun(@rdivide,f,marg_y');  %func used to divide array and a vector to find condtional func x|y

figure(2)
plot(g,f(688,:)); %plotting f(x,y) at a given y value
hold on
plot(g,z(688,:)); %plotting f(x|y) at a given y value
legend("f(x,y)","f(x|y)");
