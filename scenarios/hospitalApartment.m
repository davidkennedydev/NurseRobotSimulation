% component =  [ xPosition yPosition width height ]
limits = [0 0 3.5 3];
sofa = [0 2.45 1.76 .55];
cabinet = [0 .74 .28 1.12];
southDoor = [0 -.1 .83 .1];
northDoor = [2.66 3 .84 .1];
equipment = [3.15 .16 .35 .69];
serum = [3.15 2.07 .35 .18];
bed = [1.6 1.08 1.89 .81];

scenario1 = figure();
hold on;
axis([-1 4.5 -1 4]); % TODO max position x, y increased by 1

rectangle('Position', limits, 'EdgeColor', 'red');
rectangle('Position', sofa);
rectangle('Position', cabinet);
rectangle('Position', southDoor, 'EdgeColor', 'blue');
rectangle('Position', northDoor, 'EdgeColor', 'blue');
rectangle('Position', equipment);
rectangle('Position', serum);
rectangle('Position', bed);

% put a label name on components
% TODO with small components, put arrow and names outside
putText = @(furniture, label) text(furniture(1)+furniture(3)/2, furniture(2)+furniture(4)/2, label);

putText(bed, 'cama');
putText(sofa, 'sofa');
putText(cabinet, 'armario');
putText(serum, 'soro');
putText(equipment, 'equipamentos');
putText(southDoor, 'door');
putText(northDoor, 'door');

hold off;
