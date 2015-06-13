#!/usr/bin/octave -q

%domain limits
valenceDomain = [0 1]; %very negative until very positive

%pertinence functions for variable valence
negativeValence  = @(x) linear(x, [0 1], [.5 0]);
positiveValence  = @(x) linear(x, [.5 0], [1 1]);
noneValence = @(x) triangular(x, [.25 0], [.5 1], [.75 0]);

%domain and images smaples
curvePrecision = 0.01;
xValence = valenceDomain(1):curvePrecision:valenceDomain(2);
negativeValenceCurve = buildCurve(negativeValence, valenceDomain, curvePrecision);
positiveValenceCurve = buildCurve(positiveValence, valenceDomain, curvePrecision);
noneValenceCurve = buildCurve(noneValence, valenceDomain, curvePrecision);
veryNegativeValenceCurve = very(negativeValenceCurve);
veryPositiveValenceCurve = very(positiveValenceCurve);

%plot valence graph representation
figure;
title('Valence');
ylabel('Pertinence');
xlabel('Standarized Domain');
hold all;
plot(xValence, veryNegativeValenceCurve, 'Color', [.3,0,0]);
plot(xValence, negativeValenceCurve, 'Color', 'red');
plot(xValence, noneValenceCurve, 'Color', 'green');
plot(xValence, positiveValenceCurve, 'Color', 'blue');
plot(xValence, veryPositiveValenceCurve, 'Color', [0,0,.3]);
l = legend('very negative', 'negative', 'none', 'positive', 'very positive');
legend(l, 'location', 'northeastoutside');
pause();
