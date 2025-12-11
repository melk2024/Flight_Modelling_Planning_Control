% Given data
ft_mg = 0.8;          % Thrust-to-weight ratio
mg_S = 3000;          % Weight per unit wing area (N/m^2)
V_max = 255;          % Maximum velocity (m/s)
CD0 = 0.015;          % Zero-lift drag coefficient
K = 0.04;             % Induced drag factor
rho = 1.225;          % Air density at sea level (kg/m^3)
gamma = 0:0.1:pi/2;
V = 0:1:255;

% Define the sin(gamma) function as a function of V
sin_gamma_func = (@V)(ft_mg - (0.5 * rho* V.^2 .* ...
    (CD0 + K * (2 * mg_S *cos(gamma)./ (rho * V.^2)).^2))/ (mg_S));

% Optimization to maximize sin(gamma)
options = optimset('Display', 'off');
[optimal_V, neg_max_sin_gamma] = fminbnd(@(V) -sin_gamma_func(V), 1, V_max, options);

% Compute results
max_sin_gamma = -neg_max_sin_gamma;
max_gamma = asind(max_sin_gamma);  % Convert to degrees

% Display results
fprintf('Optimal airspeed V: %.2f m/s\n', optimal_V);
fprintf('Maximal angle of climb γ: %.2f degrees\n', max_gamma);

% for i = 1:length(V_max)
%     for j = 1:length(gamma)
%         eval(sin_gamma_func);
%     end
% end
% 
% figure
% plot(V, sin_gamma_func)