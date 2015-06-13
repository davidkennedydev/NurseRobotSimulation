function risk = affectiveFuzzy(valence, arousal, verbose = 0)
	valenceVariableDefinition
	arousalVariableDefinition
	riskVariableDefinition
	
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
	blueValue(2) = min([noneValence(valence), mediumArousal(arousal)]);
	%if positive valence and (low arousal or medium arousal) then very blue group
	veryBlueValue = min([positiveValence(valence), max(lowArousal(arousal), mediumArousal(arousal))]);

	% combine inference results
	veryRedValueCombination = max(veryRedValue);
	redValueCombination = max(redValue);
	yellowValueCombination = max(yellowValue);
	greenValueCombination = max(greenValue);
	blueValueCombination = max(blueValue);
	veryBlueValueCombination = max(veryBlueValue);

	%defuzzification

	if (verbose == 1)
		fprintf('very red risk = %f\n', veryRedValueCombination);
		fprintf('red risk = %f\n', redValueCombination);
		fprintf('yellow risk = %f\n', yellowValueCombination);
		fprintf('green risk = %f\n', greenValueCombination);
		fprintf('blue risk = %f\n', blueValueCombination);
		fprintf('very blue risk = %f\n', veryBlueValueCombination);


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
	end

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

	if (verbose == 1)
		%plot cuted graph representation
		plot(xRisk, blueRiskCurve, 'Color', [0,0,1]);
		plot(xRisk, veryBlueRiskCurve, 'Color', [0,0,.5]);
		plot(xRisk, greenRiskCurve, 'Color', [0,1,0]);
		plot(xRisk, yellowRiskCurve, 'Color', [.8,.8,0]);
		plot(xRisk, redRiskCurve, 'Color', [1,0,0]);
		plot(xRisk, veryRedRiskCurve, 'Color', [.5,0,0]);
		pause();
	end

	%combine curves
	fuzzyRegion = max([veryRedRiskCurve;redRiskCurve;yellowRiskCurve;greenRiskCurve;blueRiskCurve;veryBlueRiskCurve]);

	% center of gravity, can be modified for improve system result, because the method choice depends of problem complexion)
	if (sum(fuzzyRegion) > 0)
		risk = (fuzzyRegion * xRisk')/sum(fuzzyRegion);

		if (verbose == 1)
			area(xRisk, fuzzyRegion, 'FaceColor', [.8 .8 .8]);
			line([risk risk], [0 1], 'color', 'black', 'linestyle', '-.');
			pause();
		end
	else
		% No determined, need more rules and data
		risk = nan;

		if (verbose == 1)
			fprintf('No determined, need more rules and data\n');
		end
	end

end
