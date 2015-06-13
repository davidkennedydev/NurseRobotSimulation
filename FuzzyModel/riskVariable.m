#!/usr/bin/octave -q
riskVariableDefinition

%plot graph representation
figure;
title('Risk');
ylabel('Pertinence');
xlabel('Standarized Domain');
hold all;
plot(xRisk, veryBlueRiskCurve, 'Color', [0,0,.5]);
plot(xRisk, blueRiskCurve, 'Color', [0,0,1]);
plot(xRisk, greenRiskCurve, 'Color', [0,1,0]);
plot(xRisk, yellowRiskCurve, 'Color', [.8,.8,0]);
plot(xRisk, redRiskCurve, 'Color', [1,0,0]);
plot(xRisk, veryRedRiskCurve, 'Color', [.5,0,0]);
l = legend('very blue', 'blue', 'green', 'yellow', 'red', 'very red');
legend(l, 'location', 'northeastoutside');
pause();
