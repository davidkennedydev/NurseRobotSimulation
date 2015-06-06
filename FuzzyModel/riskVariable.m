#!/usr/bin/octave -q

%domain limits
riskDomain = [0 1]; %very low until very high

%pertinence functions for variable arousal
blueRisk  = @(x) linear(x, [0 1], [.25 0]);
greenRisk = @(x) triangular(x, [0 0], [.25 1], [.5 0]);
yellowRisk = @(x) triangular(x, [.25 0], [.5 1], [.75 0]);
redRisk = @(x) linear(x, [.5 0], [1 1]);


%domain and images smaples
curvePrecision = 0.01;
xRisk = riskDomain(1):curvePrecision:riskDomain(2);
blueRiskCurve = buildCurve(blueRisk, riskDomain, curvePrecision);
veryBlueRiskCurve = very(blueRiskCurve);
greenRiskCurve = buildCurve(greenRisk, riskDomain, curvePrecision);
yellowRiskCurve = buildCurve(yellowRisk, riskDomain, curvePrecision);
redRiskCurve = buildCurve(redRisk, riskDomain, curvePrecision);
veryRedRiskCurve = very(redRiskCurve);

%plot graph representation
figure;
hold all;
plot(xRisk, blueRiskCurve, 'Color', [0,0,1]);
plot(xRisk, veryBlueRiskCurve, 'Color', [0,0,.5]);
plot(xRisk, greenRiskCurve, 'Color', [0,1,0]);
plot(xRisk, yellowRiskCurve, 'Color', [.8,.8,0]);
plot(xRisk, redRiskCurve, 'Color', [1,0,0]);
plot(xRisk, veryRedRiskCurve, 'Color', [.5,0,0]);
pause();
