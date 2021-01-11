% IMplementation of numerical derivation

clear all
close all

% calculation of the first derivatibve for the function exp(-x)
% and its evaluation in x0=0.25
fun = @(x) exp(-x) ;
dfun = @(x) -exp(-x) ;
x0 = 0.25 ;
f_prime_x0 = dfun(x0)

% Numerical calculation of the first derivative in x_0
% set the size element h
h=0.05 ; 
% setting interva;
I_h =[x0-h x0 x0+h] ;
fI_h=fun(I_h) 
% Numerical calculation of the derivative (backward)  
df(1)=( fI_h(2) - fI_h(1) ) / h ; 
% Numerical calculation of the derivative (central)  
df(2)=( fI_h(3) - fI_h(1) ) / (2*h) ;
% Numerical calculation of the derivative (forward)  
df(3)=( fI_h(3) - fI_h(2) ) / h ;

% Error calculation
err_fprime=abs(f_prime_x0-df)

% Point 3
% determination of the several mesh element
H = 0.2*2.^-[0:1:4] ;
% Empty container to store the error calculation
ERR_df = [ ] ;
% For cycle to calculate error
for h=H
    
    I_h =[x0-h x0 x0+h] ;
    fI_h=fun(I_h) ;
    %
    % Numerical calculation of the derivative (backward)  
    df(1)=( fI_h(2) - fI_h(1) ) / h ; 
    % Numerical calculation of the derivative (central)  
    df(2)=( fI_h(3) - fI_h(1) ) / (2*h) ;
    % Numerical calculation of the derivative (forward)  
    df(3)=( fI_h(3) - fI_h(2) ) / h ;
    %
    ERR_df=[ERR_df;abs(f_prime_x0-df) ] ;

end

% Plotting the results
figure()
loglog(H,ERR_df,'LineWidth', 2 )
hold on
loglog(H, H,'--k', H,H.^2, '-k', 'LineWidth', 2 )
legend ('backward','central','forward','H', 'H^2')
title('Error-plot in log scale');
xlabel ('h')
ylabel ('err')
grid on
hold off