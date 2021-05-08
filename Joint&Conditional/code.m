clc
clear all
close all

%initialising range spaces of x and y
g = 0:0.01:1-0.01;
[x,y]=meshgrid(g); %x and y  coordinates are taken as a grid

cond = (y <= x);   %storing values x>=y   if y>x value will be zero
cond = double(cond); %converting it into matrix so that we can access each element
 
f = 8*x.*y;  %given function
f_plot = f.*cond; %applying condition to the function

% plotting the given function
figure(1)
surfc(g,g,f_plot)
xlabel('X');
ylabel('Y');
zlabel('f(x,y)');
title("Joint pdf f(x,y)");

%finding conditional and marginal pdfs

marg_y=(4*g)-(4*g.^3);%marginal of y
z1 = bsxfun(@rdivide,f,marg_y');  %func used to divide matrix and an array to find condtional func x|y

marg_x = 4*g.^3;%marginal of x
z2 = bsxfun(@rdivide,f,marg_x);%func used to divide matrix and an array to find condtional func y|x

%plotting conditional pdfs of x and y for given y and x values repectively
figure(2)
plot(g,z1(50,:))
xlabel('X');
ylabel('f(x|y)');
title("Conditional PDFs f(x|y) for given y value (y = 0.5)");

figure(3)
plot(g,z2(:,50))
xlabel('Y');
ylabel('f(y|x)');
title("Conditional PDFs f(y|x) for given x value");

%plotting marginal distributions of y and x
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