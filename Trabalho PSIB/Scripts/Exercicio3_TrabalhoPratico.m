% Example 1.7
%
load biossinal; % Get visual evoked response data;
fs = 1/.005; % Sample interval = 5 msec
N = length(sem_ruido);
t_sem_ruido = (0:N-1)/fs;
novo = vec2mat(biossinal,100); %
[NL,NC] = size(novo); % Get data matrix size

if NL < NC
novo = novo'; % Transpose matrix
t = (0:NL-1)/fs; % Generate time vector
else
t = (0:NC-1)/fs; % Time vector if no transpose
end

figure(1);
subplot(321);
plot(t_sem_ruido,sem_ruido); % Plot individual record
subplot(322);
avg1 = mean(novo); % Calculate ensemble average
plot(t,avg1); 
subplot(323);
avg2 = mean(novo(1:25,:)); % Calculate ensemble average
plot(t,avg2); 
subplot(324);
avg3 = mean(novo(1:100,:)); % Calculate ensemble average
plot(t,avg3); 
subplot(325);
avg4 = mean(novo(1:1000,:)); % Calculate ensemble average
plot(t,avg4); 



%Alinea B%
f=(0:N-1)*(fs/N);
%YI=(abs(fft(mean(novo(1:1000,:))))).^2;
YI = abs((fft(mean(novo(1:100,:)))).^2);
figure(2);
%plot(f(1:end/2),YI(1:end/2),'k');
plot(f(1:N),YI(1:end),'k');




















