# Joint-and-Conditional-PDFs-Plots
Given the joint pdf of random variables X and Y and c is normalising constant. 
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/joint_pdf.jpg)
## Plot Joint PDF f(x,y)
1. First we will initialise range spaces of x and y
2. Then form a grid with x and y coordinates
3. Initialise the function and apply the conditions
4. Then plot the 3D plot.S
5. Sample code and output is shown below.
```
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
```
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/Joint&Conditional/joint%20pdf.jpg)
## Marginal PDF of x
1. Calculate mar_x function for all y's 
2. Since function f is stored as matrix and mar_x is stored as vector , we use ```bsxfun``` to divide matrix with vector.
```
marg_x = 4*g.^3;%marginal of x
z2 = bsxfun(@rdivide,f,marg_x);%func used to divide matrix and an array to find condtional func y|x
figure(5)
plot(g,marg_x)
xlabel('X');
ylabel('marg_x');
title("marginal pdf of x");
```
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/Joint&Conditional/marginal%20pdf%20of%20x.jpg)

## Marginal PDF of y
1. Calculate mar_y function for all x's 
2. Since function f is stored as matrix and mar_y is stored as vector , we use ```bsxfun``` to divide matrix with vector.
```
marg_y=(4*g)-(4*g.^3);%marginal of y
z1 = bsxfun(@rdivide,f,marg_y');  %func used to divide matrix and an array to find condtional func x|y
figure(4)
plot(g,marg_y)
xlabel('Y');
ylabel('marg_y');
title("marginal pdf of y");
```
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/Joint&Conditional/marginal%20pdf%20of%20y.jpg)

## Conditional PDFs
```
%plotting conditional pdfs of x and y for given y and x values repectively
figure(2)
plot(g,z1(50,:))
xlabel('X');
ylabel('f(x|y)');
title("Conditional PDFs f(x|y) for given y value (y = 0.5)");
```
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/Joint&Conditional/cond%20pdf%20x-y.jpg)
```
figure(3)
plot(g,z2(:,50))
xlabel('Y');
ylabel('f(y|x)');
title("Conditional PDFs f(y|x) for given x value");
```
![](https://github.com/ashcode028/Joint-and-Conditional-PDFs-Plots/blob/93c1ac849b5057e81dc12051c57b777aebfaf2d9/Joint&Conditional/cond%20pdf%20y-x.jpg)
