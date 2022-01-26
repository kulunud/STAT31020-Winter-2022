function [y] = fn(x, c)
%strongly convex function
x1 =x(1);
x2 = x(2);
y = x1^2+c*x2^2;
end