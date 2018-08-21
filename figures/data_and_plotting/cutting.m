load('cmap_0413_insitu.mat')

load('round_MI_scan001meanAtomMatrix.mat');
MI = meanAtomMatrix;
load('line2x24_scan001meanAtomMatrix.mat');
cut = meanAtomMatrix;

yy1 = 107:131;
xx1 = 119:143;

h1=figure(131)

figwidth = 6.5/sqrt(2);
fighight = 6.5/sqrt(2);
set(h1, 'Units', 'centimeters')
h1.Position(3) = figwidth;
h1.Position(4) = fighight;

imagesc(MI(yy1,xx1),[0,1.3])
axis image
colormap(cmap_0413_insitu);
% col = colorbar
% col.Ticks = [0:.25:1].*1.3
% col.TickLabels = [0;0.25;0.5;0.75;1]
set(gca,'xtick', linspace(0.5,length(xx1)+0.5,length(xx1)+1), 'ytick', linspace(0.5,length(yy1)+.5,length(yy1)+1));
xticklabels([])
yticklabels([])
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k','LineWidth',1.2);
box off

xtl = 9;
ytl = 7;
w = 2;
h = 12;

hold on
line([xtl+w+.5,xtl+w+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+.5,ytl+.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+h+0.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
hold off

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth;
ax_height = fighight;
ax.Position = [0 0 ax_width ax_height];

%%
set(h1, 'PaperUnits', 'centimeters')
h1.PaperPositionMode = 'auto'
h1.PaperSize = [figwidth fighight]
print(h1,'..\ronnd_MI.pdf','-dpdf','-r0')

%%

ag = [0.6000    0.99000    0.2000]

gauss = @(x,w) exp(-x.^2/w.^2);
patt = @(x) (gauss(x-1,0.5)-1.03*gauss(x,0.5)+gauss(x+1,0.5)).^2

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth-0.05;
ax_height = fighight-.05;
ax.Position = [0.05 .05 ax_width ax_height];

h2=figure(1341)

figwidth = 6.5;
fighight = figwidth/sqrt(2);
set(h2, 'Units', 'centimeters')
h2.Position(3) = figwidth;
h2.Position(4) = fighight;

xx = [-4:.001:4];
ss = [-3.5:1:3.5];

ball_size = 3.2;
plot(xx, 6+cos(pi*xx).^2+patt(xx./0.9),'-','Color',[0.5 0.5 0.5],'LineWidth', 1.2)
hold on
plot([-3.5 -2.5 -1.51 -.475 .475 1.51 2.5 3.5],repmat(6.4,length(ss),1),...
    'o','color','k','MarkerFaceColor','k','markers',ball_size)
hold off

hold on
plot(xx, 3+2.*patt(xx./0.9)-.05.*xx.^2,'-','Color',[0.5 0.5 0.5],'LineWidth', 1.2)
hold off

hold on
plot([-3.9 -3.5 -3.1 -.45 .45 3.1 3.5 3.9],3.4 - .05.*[-3.9 -3.5 -3.1 -.45 .45 3.1 3.5 3.9].^2,...
    'o','color','k','MarkerFaceColor','k','markers',ball_size)
hold off

hold on
plot(xx, cos(pi*xx).^2,'-','Color',[0.5 0.5 0.5],'LineWidth', 1.2)
hold off
hold on
plot([-.475 .475],repmat(0.4,length([-.5 .5]),1),...
    'o','color','k','MarkerFaceColor','k','markers',ball_size)
hold off


box off
axis off

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth;
ax_height = fighight;
ax.Position = [0 0 ax_width ax_height];

%%
set(h2, 'PaperUnits', 'centimeters')
h2.PaperPositionMode = 'auto'
h2.PaperSize = [figwidth fighight]
print(h2,'..\cutting.pdf','-dpdf','-r0')