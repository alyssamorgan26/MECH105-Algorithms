function [I] = Simpson(x, y)
% Alyssa Morgan March 2021
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs:
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
%for simpsons 1/3 rule you have to use an even number of segment s
[row, xsize] = size(x);
[row2, ysize] = size(y);
if xsize ~= ysize || row~=1 || row2~=1 % makes sure row vectors used
    error('make sure they are equal lengths')
end 

% define variables 
I = 0;
hi = x(2)-x(1);
segment = xsize - 1;
calc = segment/2;

if x(1):hi:x(end) ~= x
    error('make sure x values are spaced equally')
end 
% warning for the trapezoidal rule for it there is an odd number of
% segments
if rem(segment,2) ~= 0
    warning('there is an odd number of segments and the trap rule will be used for the last one')
    calc = (segment-1)/2;
    I = hi/2*(y(end-1)+y(end));
end 

% simpsons 1/3 rule used
for k = 1:calc
    I = I + hi/3*(y(2*k-1)+4*y(2*k)+y(2*k+1));
end 
end 