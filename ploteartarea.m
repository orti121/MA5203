function ploteartarea(datanormal,dataaf,dataotra,dataruido,fs,tf)

% Seleccionar rango de datos
t = 0:1/fs:tf;
samples = length(t);
dnormal = datanormal(1:samples);
daf = dataaf(1:samples);
dotra = dataotra(1:samples);
druido = dataruido(1:samples);

% Calcular la fft
frecs = 0:1/tf:fs;
ftnormal = fft(dnormal);
ftaf = fft(daf);
ftotra = fft(dotra);
ftruido = fft(druido);

% Plotear waveforms
figure(1)

%Normal
subplot(4,1,1), plot(t,dnormal/max(dnormal))
%xlabel('Tiempo[s]')
ylabel('Amplitud Normalizada')
title('Señal ECG - Normal')
%AF
subplot(4,1,2), plot(t,daf/max(daf))
%xlabel('Tiempo[s]')
ylabel('A.N.')
title('Señal ECG - AF')
%Otra
subplot(4,1,3), plot(t,dotra/max(dotra))
%xlabel('Tiempo[s]')
ylabel('A.N.')
title('Señal ECG - Otra')
%Ruido
subplot(4,1,4), plot(t,druido/max(druido))
xlabel('Tiempo[s]')
ylabel('A.N.')
title('Señal ECG - Ruido')


% Plotear ffts
figure(2)

%Normal
subplot(4,1,1), plot(frecs,abs(ftnormal)/max(abs(ftnormal)))
%xlabel('Tiempo[s]')
ylabel('Amplitud Normalizada')
title('FFT ECG - Normal')
axis([0,50,0,1])
%AF
subplot(4,1,2), plot(frecs,abs(ftaf)/max(abs(ftaf)))
%xlabel('Tiempo[s]')
ylabel('A.N.')
title('FFT ECG - AF')
axis([0,50,0,1])
%Otra
subplot(4,1,3), plot(frecs,abs(ftotra)/max(abs(ftotra)))
%xlabel('Tiempo[s]')
ylabel('A.N.')
title('FFT ECG - Otra')
axis([0,50,0,1])
%Ruido
subplot(4,1,4), plot(frecs,abs(ftruido)/max(abs(ftruido)))
xlabel('Frecuencia[Hz]')
ylabel('A.N.')
title('FFT ECG - Ruido')
axis([0,50,0,1])

% Plotear Espectrogramas
figure(3)

%Normal
subplot(2,2,1), spectrogram(dnormal,64,32,300,fs,'yaxis')
title('Espectrograma ECG - Normal')

%AF
subplot(2,2,2), spectrogram(daf,64,32,300,fs,'yaxis')
title('Espectrograma ECG - AF')

%Otra
subplot(2,2,3), spectrogram(dotra,64,32,300,fs,'yaxis')
title('Espectrograma ECG - Otra')

%Ruido
subplot(2,2,4), spectrogram(druido,64,32,300,fs,'yaxis')
title('Espectrograma ECG - Ruido')
end
