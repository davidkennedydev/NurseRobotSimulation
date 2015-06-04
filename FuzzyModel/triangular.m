function p = triangular(x, first, middle, last)	
	if (x > first(1) && x <= middle(1))
		p = linear(x, first, middle);
	elseif (x > middle(1) && x <= last(1))
		p = linear(x, middle, last);
	else
		p = 0;
	end
end


