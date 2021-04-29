function [I] = trapezoidrule(func,a,b,n,varargin)
% Alyssa Morgan April 2021
% This is the trapezoidal rule for integration. It can be used when
% functions are too hard or confusing to use traditional methods and is
% more applicable to real-world engineering scenarios
% Func: The function to be integrated
% a,b are the integration limits
% n = the number of segments and defaults 100
% output: integration estimate using trap rule
if nargin < 3 
    error('at least 3 input arguments are required func, a, b')
end 
if nargin < 4 || isempty(n)
    n = 100;
end 
x = a
h = (b-a)/n;
sj = func(a,varargin{:});
for i =1: n-1
    x = x+h;
    sj = sj+2*func(x,varargin{:});
end 
sj = sj + func(b,varargin{:});
I = (b - a)*sj/(2*n);


