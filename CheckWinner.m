function Winner = CheckWinner(GameState)
Winner=0;

WinCon = cell(1,3);
% 4 Win conditions:
WinCon{1} = eye(4,4);           %Diagonal right
WinCon{2} = flip(WinCon{1},2);  %Diagonal left
WinCon{3} = [1,1,1,1];          %Horizontal
WinCon{4} = [1,1,1,1]';         %Vertical

%Loop through win conditions and check if a player has a winning score
for i = 1:4
    Score = conv2(GameState,WinCon{i},'same');

    if any(Score == 4 | Score==-4,"all")
        Winner=1;
        break;
    end
end
