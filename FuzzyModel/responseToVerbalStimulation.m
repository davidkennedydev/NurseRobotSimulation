#!/usr/bin/octave -q

%domain limits
delayDomain = [0 1]; %very low until very high

%pertinence functions for variable arousal
absent = @(x) rectangular(x, .7, 1);
normal = @(x) rectangular(x, 0, .5);
anormal = @(x) not(normal(x));



%domain and images smaples
curvePrecision = 0.01;
xDelay = delayDomain(1):curvePrecision:delayDomain(2);
absentCurve = buildCurve(absent, delayDomain, curvePrecision);
normalCurve = buildCurve(normal, delayDomain, curvePrecision);
anormalCurve = buildCurve(anormal, delayDomain, curvePrecision);

%plot arousal graph representation
figure;
title('Response to verbal stimulation');
axis([0 1 -0.1 1.1]);
ylabel('Pertinence');
xlabel('Standarized delay until response');
hold all;
plot(xDelay, normalCurve, 'Color', 'blue');
plot(xDelay, anormalCurve, 'Color', 'yellow');
plot(xDelay, absentCurve, 'Color', 'red');
l = legend('normal', 'anormal', 'absent');
legend(l, 'location', 'northeastoutside');
pause();
