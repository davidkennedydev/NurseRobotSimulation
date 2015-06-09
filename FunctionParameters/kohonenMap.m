#! /usr/bin/octave -q

% Cluster the input data

clusterPrecision = input('grid space: ');
wi = 1; 
for x = 0:clusterPrecision:1
	for y = 0:clusterPrecision:1
		W(wi,:) = [x y];
		wi = wi + 1;
	end
end
%W = rand(1/clusterPrecision, 2);
f = figure();
plot(W(:, 1), W(:, 2), 'g+');
hold on;
output = zeros(3);

learningRate = input('initial learning rate: ');
while true
	x = 	input('  x  = ');
	if (x < 0)
		break;
	end
	pX = 	input('P(x) = ');
	plot(x,pX, 'ro');
	axis([0 1 0 1]);

	euclidianDistance = @(A,B) sqrt( sum( (B .- A).^2 ) );

	lowerDistance = inf;
	lowerDistanceIndex = 0;
	for i = 1:size(W, 1)
		distance = euclidianDistance([x pX], W(i,:));
		if (distance < lowerDistance)
			lowerDistance = distance;
			lowerDistanceIndex = i;
		end
	end

	W(lowerDistanceIndex, :) = W(lowerDistanceIndex, :) + learningRate .* ([x pX] .- W(lowerDistanceIndex, :));

end
plot(W(:, 1), W(:, 2), 'b.');
pause(60*60);
delete(f);
