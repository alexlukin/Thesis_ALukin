load('cmap_0413_insitu.mat')

load('MI_box_scan001meanAtomMatrix.mat');
MI = meanAtomMatrix;
load('line2x24_scan001meanAtomMatrix.mat');
cut = meanAtomMatrix;

yy1 = 106:131;
xx1 = 115:130;

figure(131)
imagesc(MI(yy1,xx1),[0,1.4])
axis image
colormap(cmap_0413_insitu);
col = colorbar
col.Ticks = [0:.25:1].*1.4
col.TickLabels = [0;0.25;0.5;0.75;1]
set(gca,'xtick', linspace(0.5,length(xx1)+0.5,length(xx1)+1), 'ytick', linspace(0.5,length(yy1)+.5,length(yy1)+1));
xticklabels([])
yticklabels([])
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k','LineWidth',1.5);
box off


hold on
line([8.5,8.5],[1.5,0.5+yy1(end)-yy1(1)],'Color','r','LineWidth',1.5)
line([6.5,6.5],[1.5,0.5+yy1(end)-yy1(1)],'Color','r','LineWidth',1.5)
line([6.5,8.5],[1.5,1.5],'Color','r','LineWidth',1.5)
line([6.5,8.5],[0.5+yy1(end)-yy1(1),0.5+yy1(end)-yy1(1)],'Color','r','LineWidth',1.5)
hold off

xx2 = 120:123;

figure(132)
imagesc(cut(yy1,xx1),[0,1.4])
axis image
colormap(cmap_0413_insitu);
col = colorbar
col.Ticks = [0:.25:1].*1.4
col.TickLabels = [0;0.25;0.5;0.75;1]
set(gca,'xtick', linspace(0.5,length(xx1)+0.5,length(xx1)+1), 'ytick', linspace(0.5,length(yy1)+.5,length(yy1)+1));
xticklabels([])
yticklabels([])
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k','LineWidth',1.5);