clear all;
close all;

load('biossinal.mat'); %Carrega o ficheiro biossinal.mat fornecido para a realização do trabalho

fs = 1/0.005; %Frequencia do sinal com intervalo de amostragem 5ms 
N = 100; %length(sem_ruido) = 100; logo N = 100; Numero de amostras
t = (0:N-1)/fs; %Cria o vetor de tempo para valores entre 0 e N-1 (0 a 99)


%Calcular a Média do sinal%

Media = mean(sem_ruido); %Calculo da media do sinal
disp(Media); %Apresenta na consola o valor da variavel Media (Media do sinal)


%Calcular o Valor Eficaz (RMS) do sinal%

RMS = sqrt(mean(sem_ruido.^2)); %Calculo do valor eficaz do sinal
disp(RMS); %Apresenta na consola o valor da variavel RMS (Valor eficaz)


%Calcular Variancia e Desvio Padrão do sinal%

Variancia = (sum((sem_ruido-mean(sem_ruido)).^2)/(N-1)); %Calcula a Variancia do sinal 
disp(Variancia); %Apresenta o valor da Variancia na consola
Desvio_Padrao = sqrt(Variancia); %Calcula o Desvio Padrão atraves da raiz quadrada da variancia
disp(Desvio_Padrao); %Apresenta o valor do Desvio Padrão na consola


%Apresentar Graficamente o sinal com as medidas calculadas%

figure(1); %Cria a figura para ser gerado o grafico
plot(t, sem_ruido, 'k'); %Gera o grafico do sinal "sem_ruido" em função do tempo com a cor azul
hold on; 
Media = mean(sem_ruido); %Calculo da media do sinal
RMS = sqrt(mean(sem_ruido.^2)); %Calculo do valor eficaz do sinal
Variancia = (sum((sem_ruido-mean(sem_ruido)).^2)/(N-1)); %Calcula a Variancia do sinal 
Desvio_Padrao = sqrt(Variancia); %Calcula o Desvio Padrão atraves da raiz quadrada da variancia
plot([t(1) t(end)],[Desvio_Padrao+Media Desvio_Padrao+Media],'--r'); %Gera no grafico Média+Desvio Padrão
plot([t(1) t(end)],[-Desvio_Padrao+Media -Desvio_Padrao+Media],'--g'); %Gera no gráfico Média-Desvio Padrão
plot([t(1) t(end)],[Variancia Variancia],'--c'); %Gera no grafico Variancia
plot([t(1) t(end)],[RMS RMS],'--b'); %Gera no gráfico o Valor Eficaz (RMS)
plot([t(1) t(end)],[Media Media],'--m'); %Gera no grafico Média 
title('Biossinal (sem-ruido)'); %Insere no gráfico o titulo do mesmo
xlabel('Tempo t(s)'); %Insere no gráfico a legenda do eixo dos XX
ylabel('x(t)'); %Insere no gráfico a legenda do eixo dos YY
legend('Biossinal','Média+Desvio Padrão', 'Média-Desvio Padrão', 'Variancia', 'Valor Eficaz (RMS)', 'Média'); %Insere a legenda das linhas utilizadas

