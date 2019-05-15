clear;
close;

%% Simulation Parameters

% set true for sum sweet,sweet visual; 
% false for faster result
showGraphic = false;

%Youtubers are named players in this sim
nPlayers = 100;
%Number of games to be played, higher for accuracy
nTrials = 1000;

%Pause parameters for visual
pauseBetweenOpening = 0.1;
pauseWhenFound = 0.5;
%% Initialise
%setGraphics
if showGraphic
    close all;
    f = figure;
    ax = axes;
    f.WindowState = 'maximized';
    resetGraphics;
end

%Set array
players(nPlayers) = Player();
eggs(nPlayers) = Egg();
for n = 1:nPlayers
    players(n) = players(n).setNumber(n);
    eggs(n) = eggs(n).setEggNumber(n);
end

%% Procedures
nChance = nPlayers/2;
nSuccess = 0;

for trial = 1:nTrials
    %Permutate players randomly and place in order of the egg number
    randPlayerOrders = randperm(nPlayers);
    for n = 1:nPlayers
        eggs(n) = eggs(n).setPlayer(players(randPlayerOrders(n)));
    end 
    
    for player = 1:nPlayers
        if showGraphic
            titleText = sprintf('Trial #%i, Player #%i',trial, player);
            title(ax,titleText);
        end
        playerNumber = players(player).getNumber;
        nextEgg = playerNumber;
        isFound = false;
        for chance = 1:nChance
            if showGraphic
                sideText = sprintf('Successful trial: %i\nChance #%i',nSuccess,chance);
                ax.Children(1).String = sideText;
            end
            isInEgg = eggs(nextEgg).isInEgg(playerNumber);
            if isInEgg
                isFound = true;
%                 fprintf('# Players found: %i\n',player);
                if showGraphic
                    setColor(ax,nextEgg,[0 1 0]);
                end
                break;
            else
                if showGraphic
                    setColor(ax,nextEgg,[1 0 0]);
                end
                nextEgg = eggs(nextEgg).getPlayerNumber();
            end
            if showGraphic
                pause(pauseBetweenOpening);
            end
        end
        
        if isFound
            if showGraphic
                pause(pauseWhenFound);
                resetGraphics;
            end
        else
            if showGraphic
                resetGraphics;
            end
            break;
        end
    end
    if player == nPlayers && isFound
        nSuccess = nSuccess+1;
    end
end

fprintf('# Successful trial: %i/%i (%%%.2f)\n',nSuccess,nTrials,nSuccess/nTrials*100);