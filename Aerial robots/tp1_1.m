S = 27.3
W = 38220
rho = 0.4135
h =10000

e = 0.9
AR = 7.5
CD0 = 0.03
CLmax = 1.2

syms V

TR = (0.5*rho*V^2*S*CD0 + 2*W^2/(rho*V^2*pi*AR))

% A; V = 350km/h = 97.22m/s

%TRmin = eval(TR)

%plot(V, TR)

TR1 = subs(TR, 97.22)
TR1 = eval(TR1)

Vmin = sqrt(2*W/(rho*S*CLmax))