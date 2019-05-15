function ax = setColor(ax,egg,c)
if nargin < 3
    c = [1 0 0];
end
ax.Children(end-egg+1).FaceColor = c;
end

