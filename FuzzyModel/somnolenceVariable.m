#!/usr/bin/octave -q

%domain limits
xSomnolenceDomain = [0 1]; %very low until very high

%pertinence functions for variable arousal
present = @(x) rectangular(x, .5, 1);
absent = @(x) not(present(x));


%domain and images smaples
curvePrecision = 0.01;
xSomnolence = xSomnolenceDomain(1):curvePrecision:xSomnolenceDomain(2);
absentCurve = buildCurve(absent, xSomnolenceDomain, curvePrecision);
presentCurve = buildCurve(present, xSomnolenceDomain, curvePrecision);

%plot arousal graph representation
figure;
title('Somnolence');
axis([0 1 -0.1 1.1]);
ylabel('Pertinence');
xlabel('Standarized Intensity');
hold all;
plot(xSomnolence, absentCurve, 'Color', 'blue');
plot(xSomnolence, presentCurve, 'Color', 'red');
l = legend('absent', 'present');
legend(l, 'location', 'northeastoutside');
pause();
