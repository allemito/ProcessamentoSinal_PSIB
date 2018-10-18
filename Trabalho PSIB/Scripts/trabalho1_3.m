clear all;
close all;

load biossinal; % Carrega o ficheiro biossinal.mat fornecido para a realização do trabalho ;
fs = 1/.005; % Frequencia do sinal com intervalo de amostragem 5ms
N = length(sem_ruido); % Numero de amostras
t_sem_ruido = (0:N-1)/fs; %Cria o vetor de tempo
novo = vec2mat(biossinal,100); % converte o vector biossinal numa matriz com 100 colunas
[NL,NC] = size(novo); % retorna o tamanho da matriz novo

 if NL < NC % numero de linhas < que o numero de colunas
 novo = novo'; %  faz se a transposta da matriz novo
 t = (0:NL-1)/fs; % Cria o vetor de tempo
else
t = (0:NC-1)/fs; % Cria o vector de tempo
end

figure(1);
subplot(321);
plot(t_sem_ruido,sem_ruido); % representa graficamente o sinal sem ruído
title('Sem ruído');
subplot(322);
avg1 = mean(novo); % calculo da média da matriz novo
plot(t,avg1); % representa graficamente a média de 'novo' 
title('Média');
subplot(323);
avg2 = mean(novo(1:25,:)); % calcula as medidas de 'Ensemble Averaging' para 25 respostas
plot(t,avg2); 
title('Ensemble Averaging para 25 respostas');
subplot(324);
avg3 = mean(novo(1:100,:)); %  calcula as medidas de 'Ensemble Averaging' para 100 respostas
plot(t,avg3); 
title('Ensemble Averaging para 100 respostas');
subplot(325);
avg4 = mean(novo(1:1000,:)); %  calcula as medidas de 'Ensemble Averaging' para 1000 respostas
plot(t,avg4); 
title('Ensemble Averaging para 1000 respostas');



%Alinea B%

f=(0:N-1)*(fs/N); %  alcance da frequencia
YI1 = abs((fft(mean(novo(1:25,:)))).^2);  % calculo do espectro de potencia - 25 respostas
YI2 = abs((fft(mean(novo(1:100,:)))).^2); % calculo do espectro de potencia - 100 respostas
YI3 = abs((fft(mean(novo(1:1000,:)))).^2); % calculo do espectro de potencia - 1000 respostas 
YI4 = abs((fft(mean(novo(end-1:end,:)))).^2); %Calculo do espectro de potencia de resposta individual

figure(2);
subplot(221);
plot(f(1:N),YI1(1:end),'k'); % reprecentação grafica do espetro de potencia YI1 a preto
xlabel('Frequency (hz)');
ylabel('Power Spectrum');
title('25 Respostas');
subplot(222);
plot(f(1:N),YI2(1:end),'r');  % reprecentação grafica do espetro de potencia YI2 a vermelho
xlabel('Frequency (hz)');
ylabel('Power Spectrum');
title('100 Respostas');
subplot(223);
plot(f(1:N),YI3(1:end),'b');  % reprecentação grafica do espetro de potencia YI3 a azul
xlabel('Frequency (hz)');
ylabel('Power Spectrum');
title('1000 Respostas');
subplot(224);
plot(f(1:N),YI4(1:end),'c');  % reprecentação grafica do espetro de potencia YI4 a azul
xlabel('Frequency (hz)');
ylabel('Power Spectrum');
title('Resposta Individul');