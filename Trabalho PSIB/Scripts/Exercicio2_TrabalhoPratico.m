clear all;
close all;

load('biossinal.mat'); %Carrega o ficheiro biossinal.mat fornecido para a realização do trabalho

fs = 1/0.005; %Frequencia do sinal com intervalo de amostragem 5ms 
N = 100; %length(sem_ruido) = 100; logo N = 100; Numero de amostras
t = (0:N-1)/fs; %Cria o vetor de tempo para valores entre 0 e N-1 (0 a 99)
f = (0:N-1)*fs/(N-1); %Cria o vetor de frequencia

%Calculo do Espectro, Magnitude e Fase do Sinal%
Espectro = fft(sem_ruido); %Calcula o espectro do sinal pela transformada de Fourier
Magnitude = abs(Espectro); %Calcula a magnitude do Espectro
Phase = unwrap(angle(Espectro)); %Calcula a Fase do Espectro
Phase = Phase * 360/(2*pi); %Unwrap da fase do Espectro

%Graficos do Sinal em Fase e Magnitude%
subplot(1,2,1); %Cria um subplot com uma linha e duas colunas na primeira posição
plot(f,Magnitude); %Cria o plot da Magnitude do Sinal "sem_ruido"
title('Magnitude do Sinal'); %Legenda da titulo do plot de magnitude
xlabel('Frequência (Hz)'); %Legenda do eixo do XX
ylabel('Magnitude'); %Legenda do eixo do YY
subplot(1,2,2); %Cria um subplot com uma linha e duas colunas na segunda posição
plot(f,Phase); %Cria o plot da Fase do Sinal "sem_ruido"
title('Fase do Sinal'); %Legenda da titulo do plot de fase
xlabel('Frequência (Hz)'); %Legenda do eixo do XX
ylabel('Fase'); %Legenda do eixo do YY


