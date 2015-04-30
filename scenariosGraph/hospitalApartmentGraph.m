#! /usr/bin/octave -q

scale = 100;
nodesSize = 20;
S = [
	3.08	3
	3.2	2.07
	1.43	2.05
	1.04	2.34
	.38	1.29
	1.42	.54
	.39	0
	3.2	.53
]*scale;
G(1,2) = .8365;
G(1,2) = .8365;
G(1,3) = 1.8992;
G(1,5) = 3.2012;
G(2,1) = G(1,2);
G(2,3) = 1.7719;
G(2,4) = 2.1659;
G(3,1) = G(1,3);
G(3,2) = G(2,3);
G(3,4) = .4688;
G(3,5) = 1.3082;
G(3,6) = 1.5194;
G(3,7) = 2.3117;
G(4,2) = G(2,4);
G(4,3) = G(3,4);
G(4,5) = 1.2576;
G(4,6) = 1.8387;
G(4,7) = 2.4385;
G(5,1) = G(1,5);
G(5,3) = G(3,5);
G(5,4) = G(4,5);
G(5,6) = 1.2824;
G(5,7) = 1.2936;
G(5,8) = 2.8729;
G(6,3) = G(3,6);
G(6,4) = G(4,6);
G(6,5) = G(5,6);
G(6,7) = 1.1703;
G(6,8) = 1.7276;
G(7,3) = G(3,7);
G(7,4) = G(4,7);
G(7,5) = G(5,7);
G(7,6) = G(6,7);
G(7,8) = 2.8155;
G(8,5) = G(5,8);
G(8,6) = G(6,8);
G(8,7) = G(7,8);

% graph draw library inclusion
addpath('../SearchAlgorithms/graphSearch/drawGraph');
drawBackgroundGraph(700,700);
drawGraph(S,G, nodesSize);

% draw hospital apartment
addpath('../scenarios');
hospitalApartment; 

pause();

GOALS = [2 3 5 8];
OBJECTIVES_POSITION = S(GOALS,:); 
OBJECTIVES_PRIORITY = [ .50 .10 .15 .25 ]; % TODO analise signals to take this values

% fuction to reapeat each row
reprow = @(MATRIX, rep) reshape(repmat(eye(size(MATRIX, 1)), rep, 1), size(MATRIX, 1), size(MATRIX, 1) * rep)' * MATRIX;

% function to calulcate distance
distance = @(START, END) sqrt(sum((START - END).^2, 2));
% function to calculate distace from matrix, on result each column are distances of the START row to each row END
distanceMat = @(START, END) reshape(distance(reprow(START,size(END,1)), repmat(END,size(START,1),1)), size(END,1), size(START, 1));

HEURISTIC = OBJECTIVES_PRIORITY * distanceMat(S, OBJECTIVES_POSITION);

addpath('../SearchAlgorithms/graphSearch/AStar');
[ways costs] = search(G, HEURISTIC, 1, GOALS);

ways = ways(find(costs(costs < 4)), :); % limit ways founded by cost less than

% show ways founded formated, by text line and graphical
for i=1:size(ways)(1)
	% console result
	way = ways(i,:);
	way = way(find(way)); %remove zeros
	way = way(sort(nthargout(2, @unique, way, 'first'))); %remove repetitions
	fprintf('cost: %d, way: ', costs(i));
	display(way);
	
	% graphical plot
	wayGraph = zeros(size(G));
	for j = 2:numel(way)
		wayGraph(way(j-1), way(j)) = G(way(j-1), way(j));
	end
	drawBackgroundGraph(700,700);
	drawGraph(S, wayGraph, nodesSize);
	hospitalApartment; 
	title(['way ',int2str(i), ' , cost: ', int2str(costs(i))]);
	pause(.5);
end

GOALS
HEURISTIC

pause();
