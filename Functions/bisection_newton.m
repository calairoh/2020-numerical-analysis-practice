function [xi, x_iter_bisection, x_iter_newton] = bisection_newton(f, df, a, b, tol_bisection, tol_newton, maxit_newton, multiplicity)
  %NEWTON Find a root of the equation f(x) = 0 using the Newton method, starting from an initial guess obtained by few iterations of a bisection method.
  %
  %   [xi, x_iter] =  BISECTION_NEWTON(f, df, a, b, tol_bisection, tol_newton, maxit_newton, multiplicity)
  %
  %   Inputs  : f     = function handle to the function f(x)
  %             df    = function handle to the derivative of the function f(x)
  %             a     = left bound
  %             b     = right bound
  %             tol_bisection   = requested tolerance for the bisection method
  %             tol_newton   = requested tolerance for the Newton method
  %             maxit_newton = maximum number of iterations for the Newton method
  %             multiplicity = multiplicity of the root
  %   Output  : 
  %			xi = approximation of the root
  %			x_iter     = vector of the approximations of the root at each step

  if (nargin < 8)
	multiplicity = 1;
  end
  
  [xi_bisection, x_iter_bisection] = bisection(f, a, b, tol_bisection);
  [xi_newton, x_iter_newton] = newton(f, df, xi_bisection, tol_newton, maxit_newton, multiplicity);
  
  xi = xi_newton;

end
