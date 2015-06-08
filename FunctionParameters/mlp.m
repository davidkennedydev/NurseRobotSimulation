#! /usr/bin/octave -q

% Multi Layer Perceptron

%triangle
A = [.25 0]
B = [.5 1]
C = [.75 0]

xTriangle = [A(1) B(1) C(1)]
yTriangle = [A(2) B(2) C(2)]

sigmoid = @(x) 1./(1+e.^(-x))

% inputs
initialParameters = [ A B C ]

W1 = rand(6)
W2 = rand(6)
W3 = rand(6,1)

tolerance = .01
expected = .5
while true
	O1 = sigmoid(initialParameters)
	O2 = sigmoid(O1 * W1)
	O3 = sigmoid(O2 * W2)
	outputValue = sigmoid(O3 * W3)

	outputError = expected - outputValue
	
	pause(0.3);
	if (abs(outputError) <= tolerance)
		break
	end

	gradientErrorOutput = outputValue * (1 - outputValue) * outputError
	gradientError3 = O3 .* (1 - O3) .* sum(W3 * gradientErrorOutput)
	gradientError2 = O2 .* (1 - O2) .* (W2 * gradientError3')'
	learningRate = 0.5;
	W1 = W1 .+ learningRate .* initialParameters' * gradientError2
	W2 = W2 .+ learningRate .* O2' * gradientError3
	W3 = W3 .+ learningRate .* O3' * gradientErrorOutput
end


plot(xTriangle, yTriangle, 'b--')
axis([0 1 0 1]);
hold on;
A = O3(1:2)
B = O3(3:4)
C = O3(5:6)

xTriangle = [A(1) B(1) C(1)]
yTriangle = [A(2) B(2) C(2)]
plot(xTriangle, yTriangle, 'r-')
pause();

