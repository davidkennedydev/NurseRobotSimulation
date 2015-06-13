
%domain limits
arousalDomain = [0 1]; %very low until very high

%pertinence functions for variable arousal
lowArousal  = @(x) linear(x, [0 1], [.5 0]);
highArousal  = @(x) linear(x, [.5 0], [1 1]);
mediumArousal = @(x) triangular(x, [.25 0], [.5 1], [.75 0]);

%domain and images smaples
curvePrecision = 0.01;
xArousal = arousalDomain(1):curvePrecision:arousalDomain(2);
lowArousalCurve = buildCurve(lowArousal, arousalDomain, curvePrecision);
highArousalCurve = buildCurve(highArousal, arousalDomain, curvePrecision);
mediumArousalCurve = buildCurve(mediumArousal, arousalDomain, curvePrecision);
veryLowArousalCurve = very(lowArousalCurve);
veryHighArousalCurve = very(highArousalCurve);

