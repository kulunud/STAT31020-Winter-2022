function [y] = grad(x, c)
x1 =x(1);
x2 = x(2);
y = [2*x1 2*c*x2];
end