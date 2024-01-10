function [NewState] = Turn(CurrentState,Player,ptr, cx2,cy2,gx,gy,ir)
if Player == 1
    c = 'r';
else
    c= 'y';
end


AllowedMove = false;

while ~AllowedMove
    %Get click
    [x,y] = modginput(1,ptr);

    %Sort click coordinate into grid coordinates
    [~,indy] = mink(abs(x-gx),1,2);
    [~,indx] = mink(abs(y-gy),1,1);
    indx=indx(1);  indy=indy(1);

    %Check if click is within the circle if not, continue
    if ~(abs(x-gx(indx,indy)) < ir && abs(y-gy(indx,indy)) < ir)

        continue
    end

    ind = find(any(CurrentState(:,indy),2),1,"last");
    if isempty(ind)
        ind = 1;
    else
        ind = ind+1;
    end

    %Check if spot is occupied
    if ~CurrentState(indx,indy)
        AllowedMove = true;
        %Check first unoccupied slot





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
