% Load and visualize an audio file
[y, Fs] = audioread('test.wav');
t = (0:length(y)-1)/Fs;

figure;
subplot(2,1,1);
plot(t, y);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Design a low-pass FIR filter
N = 100; % Filter order
fc = 4000; % Cutoff frequency in Hz
b = fir1(N, fc/(Fs/2), 'low');

% Apply the filter to modify the audio signal
y_filtered = filter(b, 1, y);

% Plot the filtered audio signal
subplot(2,1,2);
plot(t, y_filtered);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Enable audio playback of the filtered signal
sound(y_filtered, Fs);
