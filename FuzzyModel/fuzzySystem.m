#!/usr/bin/octave -q

valenceVariable
valence = input('valence numeric value: ');
fprintf('very negative valence = %f\n', very(negativeValence(valence)));
fprintf('negative valence = %f\n', negativeValence(valence));
fprintf('none valence = %f\n', noneValence(valence));
fprintf('positive valence = %f\n', positiveValence(valence));
fprintf('very positive valence = %f\n', very(positiveValence(valence)));


arousalVariable
arousal = input('arousal numeric value: ');
fprintf('very low arousal = %f\n', very(lowArousal(arousal)));
fprintf('low arousal = %f\n', lowArousal(arousal));
fprintf('medium arousal = %f\n', mediumArousal(arousal));
fprintf('high arousal = %f\n', highArousal(arousal));
fprintf('very high arousal = %f\n', very(highArousal(arousal)));

riskVariable
%rules
%if very negative valence and very low arousal then very red group
veryRedValue(1) = min(very(negativeValence(valence)), very(lowArousal(arousal)));
%if very negative valence and very high arousal then red group
redValue(1) = min(very(negativeValence(valence)), very(highArousal(arousal)));
%if negative valence and high arousal then yellow group
yellowValue(1) = min(negativeValence(valence), highArousal(arousal));
%if negative valence and medium arousal then green group
greenValue(1) = min(negativeValence(valence), mediumArousal(arousal));
%if none valence and low arousal then blue group
blueValue(1) = min(noneValence(valence), lowArousal(arousal));
%if positive valence and (low arousal or medium arousal) then very blue group
veryBlueValue = min(positiveValence(valence), max(lowArousal(arousal), mediumArousal(arousal)));

fprintf('very red risk = %f\n', max(veryRedValue));
fprintf('red risk = %f\n', max(redValue));
fprintf('yellow risk = %f\n', max(yellowValue));
fprintf('green risk = %f\n', max(greenValue));
fprintf('blue risk = %f\n', max(blueValue));
fprintf('very blue risk = %f\n', max(veryBlueValue));
