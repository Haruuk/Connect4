function [NewState] = Turn(CurrentState,Player,ptr, cx2,cy2,gx,gy,ir)
% Set player color
if Player == 1
    c = 'r';
else
    c= 'y';
end


AllowedMove = false;

while ~AllowedMove
    %Get click
    [x,y] = modginput(ptr);

    %Sort click coordinate into grid coordinates
    [~,indy] = mink(abs(x-gx),1,2);
    [~,indx] = mink(abs(y-gy),1,1);
    indx=indx(1);  indy=indy(1);

    %Check if click is within the circle if not, try getting click again
    if ~(abs(x-gx(indx,indy)) < ir && abs(y-gy(indx,indy)) < ir)
        continue
    end

    %Check first unoccupied slot
    %We want to be able to click in any slot in a column as long as it is
    %not occupied by a player
    ind = find(any(CurrentState(:,indy),2),1,"last");
    if isempty(ind)
        ind = 1;
    else
        ind = ind+1;
    end

    %Check if spot is occupied
    if ~CurrentState(indx,indy)
        AllowedMove = true;
        
        %Make a circle with player color and update the gamestate
        if Player==1
            CurrentState(ind,indy) = 1;
        else
            CurrentState(ind,indy) = -1;
        end

        patch(cx2+gx(ind,indy), cy2+gy(ind,indy), c);
    end
end

NewState = CurrentState;
end
