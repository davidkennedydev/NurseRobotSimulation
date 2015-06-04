function y = linear(x, first, last)
	if (x >= first(1) && x <= last(1))
		coeficients = [first(1) 1; last(1) 1] \ [first(2); last(2)];
		y = coeficients(1) * x + coeficients(2);
	else
		y = 0; % out of range domain take zero image
	end
end


