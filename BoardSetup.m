%% Definitions
ptr = 'circle';     %Pointer shape
GameGrid = [1,1;    %Game grid size
            7,6];   
r = 0.45;           %Radius outer circle, blue
ir =0.85*r;         %Radius inner circle, white
GameState = zeros(GameGrid(4),GameGrid(2));

%% Game window setup
try
    close(4444)
catch
end
f = figure(4444);
f.Color = 'k';
f.WindowStyle = 'modal';
f.WindowState = "fullscreen";
f.Pointer = ptr;

disableDefaultInteractivity(gca)

axis([GameGrid(1),GameGrid(2)+1,GameGrid(3),GameGrid(4)+1]);
set(gca,'XColor', 'none','YColor','none')

%% Background
patch([GameGrid(1),GameGrid(1),GameGrid(2)+1,GameGrid(2)+1],...
        [GameGrid(3),GameGrid(4)+1,GameGrid(4)+1,GameGrid(3)], [0.3,0.6,1]);

%% Make circles
[gx,gy] = meshgrid(GameGrid(1):GameGrid(2),GameGrid(3):GameGrid(4));
gx = gx+0.5;
gy = gy+0.5;

%Circle coordinates (not translated)
cx1 = r*cos(0:2*pi/100:2*pi);
cy1 = r*sin(0:2*pi/100:2*pi);
%(Inner circles)
cx2 = ir*cos(0:2*pi/100:2*pi);
cy2 = ir*sin(0:2*pi/100:2*pi);


for j = 1:GameGrid(2)
    for i = 1:GameGrid(4)
        patch(cx1+gx(i,j),cy1+gy(i,j),[0.1,0.4,1])
        patch(cx2+gx(i,j),cy2+gy(i,j),'w')
    end
end
