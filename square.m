function ax = square(ax,x0,y0,l)
hold(ax,'on');
if nargin < 4
    l = 1;
end
x =  [x0*l,x0*l+l,x0*l+l,x0*l];
y = [y0*l,y0*l,y0*l+l,y0*l+l];
fill(x,y,'w')
hold(ax,'off');
ax = gca;
end

