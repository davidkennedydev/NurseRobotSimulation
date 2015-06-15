#! /usr/bin/octave -q

% Artificial affective enchiridion

patientsQuantity = 10;

% each value corresponds a artificial patient
valence = rand(1, patientsQuantity);
arousal = rand(1, patientsQuantity);

% apply fuzzy system and get risk numeric values
addpath('../FuzzyModel');
for i = 1:patientsQuantity
	risk(i) = affectiveFuzzy(valence(i), arousal(i));
end

figure;
hold on;
axis([0 1 0 patientsQuantity+1]);
title('Patients risk derived from affective state');
barh([valence' arousal' risk']);
legend('valence', 'arousal', 'risk');

valence, arousal, risk
pause();

