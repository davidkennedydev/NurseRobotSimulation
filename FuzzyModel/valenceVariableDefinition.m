
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

