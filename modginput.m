function [x,y] = modginput(strpointertype)

fig = gcf;
figure(gcf);

% Suspend axes 
state = uisuspend(fig);
set(gcf,'pointer',strpointertype);
fig_units = get(fig,'units');

% Wait for mouse click
% waitforbuttonpress returns 0 if mouse was clicked 1 if key
k = 1;
while k==1
    k = waitforbuttonpress;
end

% Get pointer coordinates
scrn_pt = get(0, 'PointerLocation');
set(fig,'units','pixels')
loc = get(fig, 'Position');
pt = [scrn_pt(1) - loc(1), scrn_pt(2) - loc(2)];
set(fig,'CurrentPoint',pt);

pt = get(gca, 'CurrentPoint');

x = pt(1,1);
y = pt(1,2);

%Restore figure
uirestore(state);
set(fig,'units',fig_units);
end
