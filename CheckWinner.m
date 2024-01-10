function Winner = CheckWinner(GameState)
Winner=0;

WinCon = cell(1,3);
WinCon{1} = eye(4,4);
WinCon{2} = flip(WinCon{1},2);
WinCon{3} = [1,1,1,1];
WinCon{4} = [1,1,1,1]';

for i = 1:4
    Score = conv2(GameState,WinCon{i},'same');

    if any(Score == 4 | Score==-4,"all")
        Winner=1;
        break;
    end
end
