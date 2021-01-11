f = @(x) atan(x);
m = [2 4 8 16 32 64];

a = 0;
b = 1;
int = zeros(6, 1);
exact = (1/4)*(pi - log(4));

for i = 1:6
    int(i) = composite_simpson(f, a, b, m(i));
end

err = abs(exact - int);

log_err = -diff(log(err)) / log(2);