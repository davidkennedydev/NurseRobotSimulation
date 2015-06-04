function curve = buildCurve(f, domainRange, precision)
	curve = [];
	for x = domainRange(1):precision:domainRange(2)
		curve(end+1) = f(x);
	end
end


