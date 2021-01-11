% NA LAB 2018-2019
% Authors A.G.Mauri
% Omega Polynomial function

function y = omega_polynomial_fun(xi,x)

z = 1 ; % because is a products

for j=1:size(xi,2)
    z=z.*(x-xi(j));
end
   
y=z ;

end
