#! /usr/bin/octave -q

scale = 100;
nodesSize = 50;

% graph nodes positions
POSITIONS  = [
	0	3.34
	.89   	3.34
	.89   	2.23
	.89   	1.03
	1.97	3.34
	1.97	2.23
	1.97	1.03
	3.25	3.34
	3.25	2.23
	3.25	1.03
	4.21	3.34
	4.21	2.23
	4.21	1.03
	5.6	3.34
	5.6	2.23
	5.6	1.03
	6.69	3.34
	6.69	2.23
	6.69	1.03
	7.97	3.34
	7.97	2.23
	7.97	1.03
	9.05	3.34
	9.05	2.23
	9.05	1.03
	10.33	3.34
	10.33	2.23
	10.33	1.03
	11.41	3.34
	11.41	2.23
	11.41	1.03
	12.3	3.34
]*scale;

% graph nodes path connections
CONECTIONS = zeros(size(POSITIONS, 1));

% function to calulcate distance
distance = @(START, END) sqrt(sum((START - END).^2, 2));

CONECTIONS(1,2) = distance(POSITIONS(1,:), POSITIONS(2,:));
for i = 2:3:29
	CONECTIONS(i,i+3) = distance(POSITIONS(i,:), POSITIONS(i+3,:));
	CONECTIONS(i+3,i) = CONECTIONS(i,i+3);
	CONECTIONS(i,i+1) = distance(POSITIONS(i,:), POSITIONS(i+1,:));
	CONECTIONS(i+1, i) = CONECTIONS(i,i+1);
	CONECTIONS(i+1,i+2) = distance(POSITIONS(i+1,:), POSITIONS(i+2,:));
	CONECTIONS(i+2, i+1) = CONECTIONS(i+1, i+2);
end
for i = 2:3:26
	CONECTIONS(i,i+4) = distance(POSITIONS(i,:), POSITIONS(i+4,:));
	CONECTIONS(i+4,i) = CONECTIONS(i,i+4);
	CONECTIONS(i+1,i+4) = distance(POSITIONS(i+1,:), POSITIONS(i+4,:));
	CONECTIONS(i+4,i+1) = CONECTIONS(i+1,i+4);
	CONECTIONS(i+1,i+3) = distance(POSITIONS(i+1,:), POSITIONS(i+3,:));
	CONECTIONS(i+3,i+1) = CONECTIONS(i+1,i+3);
end

addpath('../SearchAlgorithms/graphSearch/drawGraph');

drawBackgroundGraph(1200, 470);
% draw hospital UTI
addpath('../scenarios');
hospitalUTI; 
hold on;
drawGraph(POSITIONS,CONECTIONS, nodesSize);

pause();

%GOALS = [6 9 15 27];
do
	goal = input('goal number or 0 to quit: ');
	if (goal > 0)
		GOALS(end+1) = goal;
	end
until (goal == 0)
GOAL_POSITION = POSITIONS(GOALS,:); 
GOAL_PRIORITY = ones(1, numel(GOALS)); % TODO analise signals to take this values

% fuction to reapeat each row
reprow = @(MATRIX, rep) reshape(repmat(eye(size(MATRIX, 1)), rep, 1), size(MATRIX, 1), size(MATRIX, 1) * rep)' * MATRIX;

% function to calculate distace from matrix, on result each column are distances of the START row to each row END
distanceMat = @(START, END) reshape(distance(reprow(START,size(END,1)), repmat(END,size(START,1),1)), size(END,1), size(START, 1));

HEURISTIC = GOAL_PRIORITY * distanceMat(POSITIONS, GOAL_POSITION);

startPosition = input('first position: ');
addpath('../SearchAlgorithms/graphSearch/AStar');
[ways costs] = search(CONECTIONS, HEURISTIC, startPosition, GOALS, 1);

limit = input('cost limit: ');
ways = ways(find(costs(costs < limit)), :); % limit ways founded by cost less than

% show ways founded formated, by text line and graphical
for i=1:size(ways)(1)
	% console result
	way = ways(i,:);
	way = way(find(way)); %remove zeros
	way = way(sort(nthargout(2, @unique, way, 'first'))); %remove repetitions
	fprintf('cost: %d, way: ', costs(i));
	display(way);
	
	% graphical plot
	wayGraph = zeros(size(CONECTIONS));
	for j = 2:numel(way)
		wayGraph(way(j-1), way(j)) = CONECTIONS(way(j-1), way(j));
	end

	drawBackgroundGraph(1200, 470);
	% draw hospital UTI
	addpath('../scenarios');
	hospitalUTI; 
	hold on;
	drawGraph(POSITIONS, wayGraph, nodesSize);
	title(['way ',int2str(i), ' , cost: ', int2str(costs(i))]);
	pause(.5);
end

GOALS
HEURISTIC

pause();
