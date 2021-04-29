function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% Alyssa Morgan April 2021
% This function used the false position method to find the roots of a
% function 
% Inputs: func: Put in your function!!
%xl-- put in your lower guess
% xu --- put in your upper guess
% es--put in your desired error; default: 0.0001%
% maxit---- put in the max number opf iterations you want program to do:
% defaults to 200
% varargin: additional parameters...
% outputs root, function evaluated at root, apprx error, # iterations
% performed
format long 
if nargin < 3 
    error(' 3 arguments needed: func, xl, xu')
end 
practest = func(xl,varargin{:}) * func(xu,varargin{:});
if nargin<4 || isempty(es)
    es = 0.001;
end 
if nargin< 5 || isempty(maxit)
    maxit = 200;
end 
iter = 0;
ea = 100;
xr = xl;

while (1)
    yo = xr
    %Formula for false position method
    xr = xu - (func(xu).*(xl-xu))./(func(xl) - func(xu))
    iter = iter + 1
    func(xl) * func(xu) > 0
    % Error calculations
    if xr ~= 0 
        ea = abs((xr - yo)./ xr).* 100
    end
    practest = func(xl,varargin{:}) * func(xr,varargin{:});
    if practest < 0
        xl = xr;
    else if practest > 0 
            xu = xr;
        else ea = 0
        end 
    end 
    % Parameters for the loop ending
    if ea <= es || iter >= maxit
        break, end 
end 
root = xr
fx = func(xr, varargin{:});



end
