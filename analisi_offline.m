clear; clc; close all;

%% === PARAMETRI ROBOT ===
T_s = 0.1;        % Tempo di campionamento [s] (uguale a odometria)
r = 0.0345;        % Raggio ruota [m]
d = 0.128;         % Distanza tra ruote [m] (allineato a odometria)

% Stato iniziale
x_k = 0;
y_k = -0.79;
theta_k = 0;
x_kalman = [x_k; y_k; theta_k];

% Parete fissa per il LIDAR
Y_wall = 0;

% Matrice covarianza iniziale
n1 = 3;
n2 = 1;
P = eye(n1);

%% === CARICAMENTO DATI SENSORI ===

load('dati_encoder.mat');


phi_sx = dati_salvati(:,1);
phi_dx = dati_salvati(:,2);
distanza_raw = dati_salvati(:,3);


% Rimozione outlier e filtraggio LIDAR
mu = mean(distanza_raw, 'omitnan');
sigma = std(distanza_raw, 'omitnan');
z_thresh = 3;
outlier_idx = abs(distanza_raw - mu) > z_thresh * sigma;
distanza_raw_clean = distanza_raw;
distanza_raw_clean(outlier_idx) = NaN;
distanza_interp = fillmissing(distanza_raw_clean, 'linear');
window_size = 30;
media_mobile = movmean(distanza_interp, window_size);

% Conversione in metri (calibrazione LIDAR)
a_lidar = 37.20;
b_lidar = -0.86;
range = 5.0 / 1023.0;
tensione = media_mobile * range;
distanza_cm = (tensione / a_lidar).^(1 / b_lidar);
distanza_m = distanza_cm / 100;

% Calcolo incrementi encoder con rollover
phi_sx = -phi_sx;
phi_dx = -phi_dx;
delta_phi_sx = diff(phi_sx);
delta_phi_dx = diff(phi_dx);
delta_phi_sx(delta_phi_sx > 2048) = delta_phi_sx(delta_phi_sx > 2048) - 4096;
delta_phi_sx(delta_phi_sx < -2048) = delta_phi_sx(delta_phi_sx < -2048) + 4096;
delta_phi_dx(delta_phi_dx > 2048) = delta_phi_dx(delta_phi_dx > 2048) - 4096;
delta_phi_dx(delta_phi_dx < -2048) = delta_phi_dx(delta_phi_dx < -2048) + 4096;

% Conversione in radianti
k_enc = 2 * pi / 4096;
delta_phi_rad_sx = k_enc * delta_phi_sx;
delta_phi_rad_dx = k_enc * delta_phi_dx;

% Ascissa curvilinea e variazione angolo
delta_s = 0.5 * r * (delta_phi_rad_sx + delta_phi_rad_dx);
delta_theta = (r/d) * (delta_phi_rad_dx - delta_phi_rad_sx);

%% === CICLO DI LOCALIZZAZIONE ===
figure; hold on;
plot(0, 0, 'bo', 'LineWidth', 2);
legend_entries = {'EKF', 'Odometry'};

for i = 2:length(delta_s)
    % Predizione odometrica con Runge-Kutta
    motion_model = runge_kutta(x_k, y_k, theta_k, T_s, delta_s(i)/T_s, delta_theta(i)/T_s);
    x_k1 = motion_model(1);
    y_k1 = motion_model(2);
    theta_k1 = motion_model(3);

    % Misura LIDAR corrente
    y_lidar = distanza_m(i);

    % Correzione con EKF
    [x_kalman, P] = ekf(n1, n2, Y_wall, x_kalman, P, y_lidar, T_s, delta_s(i)/T_s, delta_theta(i)/T_s);

    % Visualizzazione
    plot(x_k1, y_k1, 'r.');           % odometria
    plot(x_kalman(1), x_kalman(2), 'b.'); % EKF

    % Aggiorna stato odometrico
    x_k = x_k1;
    y_k = y_k1;
    theta_k = theta_k1;
    %fprintf("Iter %d | y_kalman = %.3f m | z = %.3f m | innovazione = %.3f m\n", ...
        %i, x_kalman(2), y_lidar, y_lidar - (x_kalman(2) - Y_wall));

end

x_finale = x_kalman(1);
y_finale = x_kalman(2);
error = norm([1.8; -0.79] - [x_finale; y_finale]);
fprintf("Errore finale di localizzazione: %.3f m\n", error);

legend(legend_entries);
xlabel('X [m]'); ylabel('Y [m]');
title('Confronto Odometria vs EKF');
grid on; axis equal;

%% === FUNZIONI ===
function output = runge_kutta(x_k, y_k, theta_k, T_s, v, w)
    output = [ x_k + v*T_s*cos(theta_k + w*T_s/2);
               y_k + v*T_s*sin(theta_k + w*T_s/2);
               theta_k + w*T_s ];
end

function w_ = adattive_w(nu)
    base = 0.8;
    max_w = 5;
    min_w = 0.01;
    w_ = base + abs(nu);
    w_ = min(max(w_, min_w), max_w);
end

% function [x1, P1] = ekf(n1, n2, Y, x, P, y, T_s, v, omega)
%     v_ = 0.02;  % Rumore modello
%     x_pred = [
%         x(1) + T_s*v*cos(x(3) + omega*T_s/2);
%         x(2) + T_s*v*sin(x(3) + omega*T_s/2);
%         x(3) + T_s*omega
%     ];
%     F = [
%         1, 0, -T_s*v*sin(x(3) + omega*T_s/2);
%         0, 1,  T_s*v*cos(x(3) + omega*T_s/2);
%         0, 0, 1
%     ];
%     V_k = v_^2 * eye(n1);
%     P = F * P * F' + V_k;
% 
%     H = [0, -1, 0];
%     h = Y - x_pred(2);
%     nu = y - h;
% 
%     w_ = adattive_w(nu);
%     W_k = w_^2 * eye(n2);
% 
%     R = P * H' / (H * P * H' + W_k);
%     x1 = x_pred + R * nu;
%     P1 = P - R * H * P;
% end
% function [x1, P1] = ekf(n1, n2, Y_wall, x, P, z, T_s, v, omega)
% 
%     % Predizione stato (modello di moto)
%     theta_mid = x(3) + omega * T_s / 2;
%     x_pred = [
%         x(1) + T_s*v*cos(theta_mid);
%         x(2) + T_s*v*sin(theta_mid);
%         x(3) + T_s*omega
%     ];
% 
%     % Jacobiano del modello di moto
%     F = [
%         1, 0, -T_s*v*sin(theta_mid);
%         0, 1,  T_s*v*cos(theta_mid);
%         0, 0, 1
%     ];
% 
%     Q = 0.02^2 * eye(n1);
%     P_pred = F * P * F' + Q;
% 
%     % === MISURA ===
%     h = x_pred(2) - Y_wall;   % distanza dal robot alla parete (LIDAR misura verso sinistra)
%     H = [0, 1, 0];             % der. rispetto a y
% 
%     nu = z - h;                % innovazione
% 
%     R = adattive_w(nu)^2 * eye(n2);
%     S = H * P_pred * H' + R;
%     K = P_pred * H' / S;
% 
%     x1 = x_pred + K * nu;
%     P1 = (eye(n1) - K * H) * P_pred;
% end


% CASO IN CUI LA PARETE STA A SINISTRA (NEGATIVO)
function [x1, P1] = ekf(n1, n2, Y_wall, x, P, z, T_s, v, omega)

    % Predizione stato
    theta_mid = x(3) + omega * T_s / 2;
    x_pred = [
        x(1) + T_s*v*cos(theta_mid);
        x(2) + T_s*v*sin(theta_mid);
        x(3) + T_s*omega
    ];

    % Jacobiano del modello di moto
    F = [
        1, 0, -T_s*v*sin(theta_mid);
        0, 1,  T_s*v*cos(theta_mid);
        0, 0, 1
    ];

    Q = 0.02^2 * eye(n1);
    P_pred = F * P * F' + Q;

    % === MODELLO DI MISURA ===
    h = Y_wall - x_pred(2);   % distanza attesa dal robot alla parete
    H = [0, -1, 0];
    nu = z - h;

    R = adattive_w(nu)^2 * eye(n2);
    S = H * P_pred * H' + R;
    K = P_pred * H' / S;

    x1 = x_pred + K * nu;
    P1 = (eye(n1) - K * H) * P_pred;
end

