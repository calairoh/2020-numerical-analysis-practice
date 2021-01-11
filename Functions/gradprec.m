function [x, iter, err_res] = gradprec(A, b, P, x0, tol, nmax)
%
% Metodo del gradiente precondizionato (Richardson dinamico precondizionato)
%
% Parametri di ingresso:
%
% A: matrice di sistema
% b: vettore termine noto
% P: precondizionatore
% x: guess iniziale
% tol:  tolleranza criterio d'arresto
% nmax: numero massimo di iterazioni ammesse
%
% Parametri di uscita:
%
% x: soluzione
% iter: numero di iterazioni
% err_res: errore come residuo normalizzato

x = x0;
err_res=[];
for iter = 0:nmax
    
    r = b - A * x;
    err = norm(r) / norm(b);
    err_res = [err_res, err];
    
    % Verifica condizioni
    if (err < tol)
        fprintf('Richardson converge in %d iterazioni \n', iter);
        return
    elseif (iter == nmax)
        fprintf('Richardson non converge in %d iterazioni. \n', iter)
        return
    end
    
    z = P \ r;
%     if (nargin == 6)
        alpha = (z' * r) / (z' * A * z); % alpha dinamico
%     end
    x = x + alpha * z;
    
end
