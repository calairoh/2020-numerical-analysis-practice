function [InvA] = MyInv(A)

    n = length(A(1,:));
    [L, U] = lu(A);
    
    for i = 1:n
        
        ei = zeros(n, 1);
        ei(i) = 1;
        
        y          = forward_substitution (L, ei);
        InvA(:, i) = backward_substitution(U, y);
    end

end