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

