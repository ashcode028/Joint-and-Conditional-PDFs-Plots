
clc
clear all
close all
%initialising range spaces of x and y
g = 0:0.001:1-0.001;
[x,y]=meshgrid(g); %storing coordinates as a grid

cond = (y <= x);   %storing values x>y   if y>x value stored will be zero
cond = double(cond); %converting it into matrix so that we can access each element

 
f = 8*x.*y;
f_plot = f.*cond; %applying condition to the function

figure(1)
surfc(g,g,f_plot)
xlabel('X');
ylabel('Y');
zlabel('f(x,y)');
title("Joint pdf f(x,y)");



marg_y=(4*g)-(4*g.^3);%marginal of y
z1 = bsxfun(@rdivide,f,marg_y');  %func used to divide matrix and an array to find condtional func x|y


marg_x = 4*g.^3;%marginal of x
z2 = bsxfun(@rdivide,f,marg_x');%func used to divide matrix and an array to find condtional func y|x

figure(2)
surf(g,g,z1)
xlabel('X');
ylabel('Y');
zlabel('f(x|y)');
title("Conditional PDFs f(x|y)");


figure(3)
surf(g,g,z2)
xlabel('X');
ylabel('Y');
zlabel('f(y|x)');
title("Conditional PDFs f(y|x)");


figure(4)
plot(g,marg_y)
xlabel('Y');
ylabel('marg_y');
title("marginal pdf of y");

figure(5)
plot(g,marg_x)
xlabel('X');
ylabel('marg_x');
title("marginal pdf of x");
