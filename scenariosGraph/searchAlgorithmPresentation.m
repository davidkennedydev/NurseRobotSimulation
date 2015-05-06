#! /usr/bin/octave -q

scale = 100;
nodesSize = 50;

POSITIONS = [
	3	4
	2	3
	5	3
	1	2
	4	2
	6	2
	5	2
	2	1
	5	1
	6	1
]*scale;

CONNECTIONS = zeros(size(POSITIONS, 1));
distance = @(START, END) sqrt(sum((START - END).^2, 2));
distancePos = @(startPos, endPos) distance(POSITIONS(startPos,:), POSITIONS(endPos,:));
CONNECTIONS(1,2) = distancePos(1,2);
CONNECTIONS(1,3) = distancePos(1,3);
CONNECTIONS(2,4) = distancePos(2,4);
CONNECTIONS(3,2) = distancePos(3,2);
CONNECTIONS(3,5) = distancePos(3,5);
CONNECTIONS(3,7) = distancePos(3,7);
CONNECTIONS(3,6) = distancePos(3,6);
CONNECTIONS(4,8) = distancePos(4,8);
CONNECTIONS(5,9) = distancePos(5,9);
CONNECTIONS(7,8) = distancePos(7,8);
CONNECTIONS(6,9) = distancePos(6,9);
CONNECTIONS(6,10) = distancePos(6,10);
CONNECTIONS

addpath('../SearchAlgorithms/graphSearch/drawGraph');
drawBackgroundGraph(700,500);
drawGraph(POSITIONS,CONNECTIONS, nodesSize);

printf('Press enter to start graph search...\n');
pause();


GOALS = [ 8 9 10 ]
GOAL_POSITION = POSITIONS(GOALS,:); 
GOAL_PRIORITY = [.33 .33 .33]

reprow = @(MATRIX, rep) reshape(repmat(eye(size(MATRIX, 1)), rep, 1), size(MATRIX, 1), size(MATRIX, 1) * rep)' * MATRIX;
distanceMat = @(START, END) reshape(distance(reprow(START,size(END,1)), repmat(END,size(START,1),1)), size(END,1), size(START, 1));

HEURISTIC = GOAL_PRIORITY * distanceMat(POSITIONS, GOAL_POSITION);


startPosition = 1;
addpath('../SearchAlgorithms/graphSearch/AStar');
[ways costs] = search(CONNECTIONS, HEURISTIC, startPosition, GOALS, 1);

presentationForm = input('select presentation type (0 - automatic, 1 - slide-by-slide): ');
% show ways founded formated, by text line and graphical
for i=1:size(ways)(1)
	% console result
	way = ways(i,:);
	way = way(find(way)); %remove zeros
	way = way(sort(nthargout(2, @unique, way, 'first'))); %remove repetitions
	fprintf('cost: %d, way: ', costs(i));
	display(way);
	
	% graphical plot
	wayGraph = zeros(size(CONNECTIONS));
	for j = 2:numel(way)
		wayGraph(way(j-1), way(j)) = CONNECTIONS(way(j-1), way(j));
	end

	drawBackgroundGraph(700,500);
	drawGraph(POSITIONS, wayGraph, nodesSize);
	title(['way ',int2str(i), ' , cost: ', int2str(costs(i))]);
	if (presentationForm == 0)
		pause(.5);
	else
		printf('Press enter to a new slide...\n');
		pause();
	end
end

GOALS
HEURISTIC

printf('Press enter to close all windows.\n');
pause();
