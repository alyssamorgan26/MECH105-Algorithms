% Alyssa Morgan, March 16 2021
function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix that keeps track of pivoting 
% Alyssa Morgan, March 16 2021
[n,m] = size(A)

if n ~= m 
    error('Your matrix has to be a square....')
end 

for i = (1:n)
    for j = (1:m)
        if A(i,j) == 0 
            error(' the rows or the columns can not be zero')
        end 
    end 
end 

matrixxx = size(A)
U = A; 
P = eye(matrixxx);
L = zeros(matrixxx);


for i = 1:matrixxx(1)-1
    % subtract 1 because otherwise it will be 1 too high 
    
    [r,c] = max(abs(U(i:matrixxx(1),i)));
    c = c+i-1; 
    
    
    
    % This is the code that does the pivoting and switches them around
    U([i,c],:) = U([c,i],:);
    L([i,c],:) = L([c,i],:); 
    P([i,c],:) = P([c,i],:);
    
    
    for j = i+1:matrixxx(1)
        % this tells it to find multiplication factor and then puts it into a lower triangle matrix 
        heyo = U(j,i)/U(i,i);
        U(j,:)= U(j,:)-(U(i,:)*heyo);
        L(j,i) = heyo 
    end 
end 
% output matrices 
U 
P
L = L+eye(matrixxx); % created the L matrix 
 disp(L)
 disp(U)
 disp(P)
