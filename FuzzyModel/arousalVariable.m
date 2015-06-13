#!/usr/bin/octave -q
arousalVariableDefinition

%plot arousal graph representation
figure;
title('Arousal');
ylabel('Pertinence');
xlabel('Standarized Domain');
hold all;
plot(xArousal, veryLowArousalCurve, 'Color', [.3,0,0]);
plot(xArousal, lowArousalCurve, 'Color', 'red');
plot(xArousal, mediumArousalCurve, 'Color', 'green');
plot(xArousal, highArousalCurve, 'Color', 'blue');
plot(xArousal, veryHighArousalCurve, 'Color', [0,0,.3]);
l = legend('very low', 'low', 'medium', 'high', 'very high');
legend(l, 'location', 'northeastoutside');
pause();
