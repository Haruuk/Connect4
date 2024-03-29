clear
%% Game Setup
BoardSetup;

%% Game loop
Winner=false;
PlayerTurn=2;%Yellow ->Red starts
while ~Winner
    % Swap players
    switch PlayerTurn
        case 1
            PlayerTurn = 2;
        case 2
            PlayerTurn = 1;
    end

    % Take turn
    [GameState] = Turn(GameState,PlayerTurn,ptr,cx2,cy2,gx,gy,ir);

    %Check Winner
    Winner = CheckWinner(GameState);
end
%% End Game
close(f)

if PlayerTurn == 1
    WinPlayer = "Red";
else
    WinPlayer = "Yellow";
end

fprintf('Congratulations! %s Player Wins!\n',WinPlayer)




