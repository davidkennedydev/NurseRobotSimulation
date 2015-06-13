#!/usr/bin/octave -q

%domain limits
temperatureDomain = [30 42]; %very low until very high

%pertinence functions for variable arousal
hypothermia = @(x) linear(x, [30 1], [37 0]);
normal = @(x) triangular(x, [35 0], [36.5 1], [37.5 0]);
fever = @(x) linear(x, [36 0], [42 1]); 

%domain and images smaples
curvePrecision = 0.01;
xTemperature = temperatureDomain(1):curvePrecision:temperatureDomain(2);
hypothermiaCurve = buildCurve(hypothermia, temperatureDomain, curvePrecision);
normalCurve = buildCurve(normal, temperatureDomain, curvePrecision);
feverCurve = buildCurve(fever, temperatureDomain, curvePrecision);

%plot arousal graph representation
figure;
title('Body Temperature');
ylabel('Pertinence');
xlabel('Temperature (Celsius)');
hold all;
plot(xTemperature, hypothermiaCurve, 'Color', 'blue');
plot(xTemperature, normalCurve, 'Color', 'green');
plot(xTemperature, feverCurve, 'Color', 'red');
l = legend('hypothermia', 'normal', 'fever');
legend(l, 'location', 'northeastoutside');
pause();
