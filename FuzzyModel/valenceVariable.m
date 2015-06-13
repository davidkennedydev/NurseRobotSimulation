#!/usr/bin/octave -q
valenceVariableDefinition

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
