load('cmap_0413_insitu.mat')

load('expansion_no_kick_scan001meanAtomMatrix.mat');
MI = meanAtomMatrix;
MI = MI./max(max(MI));
load('expansion_with_kick_scan001meanAtomMatrix.mat');
cut = meanAtomMatrix;
cut = cut./max(max(cut));

yy1 = 120:131;
xx1 = [78:138 177:215];

h1=figure(13152)

figwidth = 12;
fighight = 12/100*12;
set(h1, 'Units', 'centimeters')
h1.Position(3) = figwidth;
h1.Position(4) = fighight;

imagesc(MI(yy1,xx1))%,[0,1.18])
axis image
colormap(cmap_0413_insitu);
% col = colorbar
% col.Ticks = [0:.25:1].*1.4
% col.TickLabels = [0;0.25;0.5;0.75;1]
set(gca,'xtick', linspace(0.5,length(xx1)+0.5,length(xx1)+1), 'ytick', linspace(0.5,length(yy1)+.5,length(yy1)+1));
xticklabels([])
yticklabels([])
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k','LineWidth',1.5);
box off

xtl = 47;
ytl = 0;
w = 2;
h = 12;

hold on
line([xtl+w+.5,xtl+w+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+.5,ytl+.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+h+0.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
hold off

set(gca, 'FontSize', 8, 'LineWidth', 0.001, 'FontName', 'Arial');
axis off

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
print(h1,'..\expansion_no_kick.pdf','-dpdf','-r0')

%%
yy2 = 113:124;
xx2 = 81:180;

h1=figure(132525)

figwidth = 12;
fighight = 12/100*12;
set(h1, 'Units', 'centimeters')
h1.Position(3) = figwidth;
h1.Position(4) = fighight;

imagesc(cut(yy2,xx2))%,[0,1.08])
axis image
colormap(cmap_0413_insitu);
% col = colorbar
% col.Ticks = [0:.25:1].*1.4
% col.TickLabels = [0;0.25;0.5;0.75;1]
set(gca,'xtick', linspace(0.5,length(xx1)+0.5,length(xx1)+1), 'ytick', linspace(0.5,length(yy1)+.5,length(yy1)+1));
xticklabels([])
yticklabels([])
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k','LineWidth',1.5);

hold on
line([xtl+w+.5,xtl+w+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+.5,ytl+.5],'Color','r','LineWidth',1.5)
line([xtl+.5,xtl+w+.5],[ytl+h+0.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
hold off

axis off

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
print(h1,'..\expansion_with_kick.pdf','-dpdf','-r0')