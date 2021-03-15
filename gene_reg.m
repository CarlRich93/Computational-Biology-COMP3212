function dydt = gene_reg(t,y)
% reaction rates
k1 = 1;
k2 = 2;
k3 = 0.02;
k4 = 0.04;
% A = Avogadro's constant- apply to equations if you want to convert concentration (moles) to
% number of molecules. Applying this constant will just scale the results!
%A = 6.022*(10^23);

% [X] = y(1), [Y] = y(2)
dy1 = k1 - k2*y(1) + k3*y(2)*y(1)^2 - k4*y(1);
dy2 = k2*y(1) - k3*y(2);

dydt = [dy1;dy2];