scale = 100;

limits = 	scale .* [0 0 12.3 4.2];
leftDoor = 	scale .* [-.2 2.49 .2 1.71];
righttDoor = 	scale .* [12.3 2.49 .2 1.71];

wall =		scale .* [.23 0 .04 2.14];
equipment =	scale .* [.44 0 .45 .5];
bed =		scale .* [1 0 .86 2];
serum = 	scale .* [1.97 0 .45 .45];

wall2  = [wall(1) + scale * 2.4, wall(2:4)];
equipment2  = [equipment(1) + scale * 2.4, equipment(2:4)];
bed2  = [bed(1) + scale * 2.4, bed(2:4)];
serum2  = [serum(1) + scale * 2.4, serum(2:4)];

wall3  = [wall(1) + scale * 2.4 * 2, wall(2:4)];
equipment3  = [equipment(1) + scale * 2.4 * 2, equipment(2:4)];
bed3  = [bed(1) + scale * 2.4 * 2, bed(2:4)];
serum3  = [serum(1) + scale * 2.4 * 2, serum(2:4)];

wall4  = [wall(1) + scale * 2.4 * 3, wall(2:4)];
equipment4  = [equipment(1) + scale * 2.4 * 3, equipment(2:4)];
bed4  = [bed(1) + scale * 2.4 * 3, bed(2:4)];
serum4  = [serum(1) + scale * 2.4 * 3, serum(2:4)];

wall5  = [wall(1) + scale * 2.4 * 4, wall(2:4)];
equipment5  = [equipment(1) + scale * 2.4 * 4, equipment(2:4)];
bed5  = [bed(1) + scale * 2.4 * 4, bed(2:4)];
serum5  = [serum(1) + scale * 2.4 * 4, serum(2:4)];

figure('Position', limits);
hold on;
axis([-1 * scale, limits(3) + 1*scale, -1*scale, limits(4) + 1*scale]); 

rectangle('Position', limits, 'EdgeColor', 'red'); 
rectangle('Position', leftDoor, 'EdgeColor', 'blue');
rectangle('Position', righttDoor, 'EdgeColor', 'blue');
rectangle('Position', wall);	  
rectangle('Position', equipment);
rectangle('Position', bed);  
rectangle('Position', serum);
rectangle('Position', wall2);
rectangle('Position', equipment2);
rectangle('Position', bed2);
rectangle('Position', serum2);
rectangle('Position', wall3);
rectangle('Position', equipment3);
rectangle('Position', bed3);
rectangle('Position', serum3);
rectangle('Position', wall4);
rectangle('Position', equipment4);
rectangle('Position', bed4);
rectangle('Position', serum4);
rectangle('Position', wall5);
rectangle('Position', equipment5);
rectangle('Position', bed5);
rectangle('Position', serum5);

putText = @(furniture, label) text(furniture(1)+furniture(3)/2, furniture(2)+furniture(4)/2, label);

putText(leftDoor, 'door');
putText(righttDoor, 'door');
putText(bed, 'bed 1');
putText(bed2, 'bed 2');
putText(bed3, 'bed 3');
putText(bed4, 'bed 4');
putText(bed5, 'bed 5');

hold off;
