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

risk = affectiveFuzzy(valence, arousal, 1) %verbose fuzzy system execution
