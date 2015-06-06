#!/usr/bin/octave -q


%fuzzification of input variables

valenceVariable
valence = input('valence numeric value: ');
fprintf('very negative valence = %f\n', very(negativeValence(valence)));
fprintf('negative valence = %f\n', negativeValence(valence));
fprintf('none valence = %f\n', noneValence(valence));
fprintf('positive valence = %f\n', positiveValence(valence));
fprintf('very positive valence = %f\n', very(positiveValence(valence)));
line([valence valence], [0 1], 'color', 'black', 'linestyle', '-.');
pause();


arousalVariable
arousal = input('arousal numeric value: ');
fprintf('very low arousal = %f\n', very(lowArousal(arousal)));
fprintf('low arousal = %f\n', lowArousal(arousal));
fprintf('medium arousal = %f\n', mediumArousal(arousal));
fprintf('high arousal = %f\n', highArousal(arousal));
fprintf('very high arousal = %f\n', very(highArousal(arousal)));
line([arousal arousal], [0 1], 'color', 'black', 'linestyle', '-.');
pause();


riskVariable
% apply implication rules
%if very negative valence and very low arousal then very red group
veryRedValue(1) = min([very(negativeValence(valence)), very(lowArousal(arousal))]);
%if very negative valence and very high arousal then red group
redValue(1) = min([very(negativeValence(valence)), very(highArousal(arousal))]);
%if negative valence and high arousal then yellow group
yellowValue(1) = min([negativeValence(valence), highArousal(arousal)]);
%if negative valence and medium arousal then green group
greenValue(1) = min([negativeValence(valence), mediumArousal(arousal)]);
%if none valence and low arousal then blue group
blueValue(1) = min([noneValence(valence), lowArousal(arousal)]);
%if none valence and medium arousal then blue group
blueValue(1) = min([noneValence(valence), mediumArousal(arousal)]);
%if positive valence and (low arousal or medium arousal) then very blue group
veryBlueValue = min([positiveValence(valence), max(lowArousal(arousal), mediumArousal(arousal))]);

veryRedValueCombination = max(veryRedValue);
redValueCombination = max(redValue);
yellowValueCombination = max(yellowValue);
greenValueCombination = max(greenValue);
blueValueCombination = max(blueValue);
veryBlueValueCombination = max(veryBlueValue);

fprintf('very red risk = %f\n', veryRedValueCombination);
fprintf('red risk = %f\n', redValueCombination);
fprintf('yellow risk = %f\n', yellowValueCombination);
fprintf('green risk = %f\n', greenValueCombination);
fprintf('blue risk = %f\n', blueValueCombination);
fprintf('very blue risk = %f\n', veryBlueValueCombination);


%defuzzification

figure;
axis([riskDomain 0 1]);
hold on;
%plot entire graph representation
plot(xRisk, blueRiskCurve, 'Color', [0,0,1], 'lineStyle', ':', 'linewidth', 2);
plot(xRisk, veryBlueRiskCurve, 'Color', [0,0,.5], 'lineStyle', ':', 'linewidth', 2);
plot(xRisk, greenRiskCurve, 'Color', [0,1,0], 'lineStyle', ':', 'linewidth', 2);
plot(xRisk, yellowRiskCurve, 'Color', [.8,.8,0], 'lineStyle', ':', 'linewidth', 2);
plot(xRisk, redRiskCurve, 'Color', [1,0,0], 'lineStyle', ':', 'linewidth', 2);
plot(xRisk, veryRedRiskCurve, 'Color', [.5,0,0], 'lineStyle', ':', 'linewidth', 2);
pause();


%cut in pertinence functions
for i = 1:numel(xRisk)
	if (veryRedRiskCurve(i) > veryRedValueCombination)
		veryRedRiskCurve(i) = veryRedValueCombination;
	end
	if (redRiskCurve(i) > redValueCombination)
		redRiskCurve(i) = redValueCombination;
	end
	if (yellowRiskCurve(i) > yellowValueCombination)
		yellowRiskCurve(i) = yellowValueCombination;
	end
	if (greenRiskCurve(i) > greenValueCombination)
		greenRiskCurve(i) = greenValueCombination;
	end
	if (blueRiskCurve(i) > blueValueCombination)
		blueRiskCurve(i) = blueValueCombination;
	end
	if (veryBlueRiskCurve(i) > veryBlueValueCombination)
		veryBlueRiskCurve(i) = veryBlueValueCombination;
	end
end

%combine functions
fuzzyRegion = max([veryRedRiskCurve;redRiskCurve;yellowRiskCurve;greenRiskCurve;blueRiskCurve;veryBlueRiskCurve]);

%plot cuted graph representation
plot(xRisk, blueRiskCurve, 'Color', [0,0,1]);
plot(xRisk, veryBlueRiskCurve, 'Color', [0,0,.5]);
plot(xRisk, greenRiskCurve, 'Color', [0,1,0]);
plot(xRisk, yellowRiskCurve, 'Color', [.8,.8,0]);
plot(xRisk, redRiskCurve, 'Color', [1,0,0]);
plot(xRisk, veryRedRiskCurve, 'Color', [.5,0,0]);
pause();


%centroid
if (sum(fuzzyRegion) > 0)
	risk = (fuzzyRegion * xRisk')/sum(fuzzyRegion)
	line([risk risk], [0 1], 'color', 'black', 'linestyle', '--');
	area(xRisk, fuzzyRegion, 'FaceColor', [.8 .8 .8]);
	pause();
else
	fprintf('No determined, need more rules and data\n');
end

