%resetGraphics
delete(ax.Children);

y = 0;
for player = 1:nPlayers
    if mod(player-1,10) == 0 && player ~= 1
        y = y+1;
    end
    x = mod(player-1,10);
    ax = square(ax,x,y);
end
axis(ax,'equal');
xlim(ax,[0 10]);
xticks(1:1:10);
yticks(1:1:y+1);
ylim(ax,[0 y+1]);

sideText = sprintf('Chance #%i',0);
text(ax,ax.XLim(2)+0.1,ax.YLim(2)/2,sideText,'FontSize',14);