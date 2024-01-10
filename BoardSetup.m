%% Game window setup
ptr = 'circle';
GameGrid = [1,1;
            7,6];
r = 0.45;
ir =0.85*r;
GameState = zeros(GameGrid(4),GameGrid(2));
try
close(4444)
catch
end
f = figure(4444);
f.Color = 'k';
f.WindowStyle = 'modal';
f.WindowState = "fullscreen";
disableDefaultInteractivity(gca)

f.Pointer = ptr;


axis([GameGrid(1),GameGrid(2)+1,GameGrid(3),GameGrid(4)+1]);

% Background
patch([GameGrid(1),GameGrid(1),GameGrid(2)+1,GameGrid(2)+1],...
        [GameGrid(3),GameGrid(4)+1,GameGrid(4)+1,GameGrid(3)], [0.3,0.6,1]);
%No axes
set(gca,'XColor', 'none','YColor','none')

[gx,gy] = meshgrid(GameGrid(1):GameGrid(2),GameGrid(3):GameGrid(4));
gx = gx+0.5;
gy = gy+0.5;

%Slots
%Circle coordinates (not translated)
cx1 = r*cos(0:2*pi/100:2*pi);
cy1 = r*sin(0:2*pi/100:2*pi);
cx2 = ir*cos(0:2*pi/100:2*pi);
cy2 = ir*sin(0:2*pi/100:2*pi);


for j = 1:GameGrid(2)
    for i = 1:GameGrid(4)
        patch(cx1+gx(i,j),cy1+gy(i,j),[0.1,0.4,1])
        patch(cx2+gx(i,j),cy2+gy(i,j),'w')
    end
end
