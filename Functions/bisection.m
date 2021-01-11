function [xi, x_iter] = bisection(f, a, b, tol)
  %BISECTION Find a root of the equation f(x) = 0 in the interval [a,b]
  %   using bisection method. The interval limits must be such that f(a)*f(b)<0.
  %
  %   [xi, x_iter] = BISECTION(f, a, b, tol)
  %
  %   Inputs  : f     = function handle to the function f(x)
  %             a     = left bound
  %             b     = right bound
  %             tol   = requested tolerance
  %   Output  : 
  %			xi = approximation of the root
  %			x_iter     = vector of the approximations of the root at each step

  % Number of necessary iterations to match the requested tolerance
  max_iterb = ceil( log((b - a)/tol)/log(2) );
  
  for (iter = 1:max_iterb)
    x_iter(iter) = a + (b-a)/2;
    f_iter(iter) = f(x_iter(iter));
    
    if ( f(b)*f_iter(iter) < 0 )
      a = x_iter(iter);
    elseif ( f(a)*f_iter(iter) < 0 )
      b = x_iter(iter);
    else % f(x) = 0
      break;
    end
  end
  
  xi = x_iter(end);

end
