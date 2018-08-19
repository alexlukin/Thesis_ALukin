load('cmap_0413_insitu.mat')

load('round_MI_scan001meanAtomMatrix.mat');
MI = meanAtomMatrix;
load('line2x24_scan001meanAtomMatrix.mat');
cut = meanAtomMatrix;

yy1 = 107:131;
xx1 = 119:143;

h1=figure(131)

fighight = 4.6;
figwidth = 4.6;

set(h1, 'Units', 'centimeters')
h1.Position(3) = figwidth;
h1.Position(4) = fighight;

subplot(1,2,1)
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
% line([xtl+w+.5,xtl+w+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
% line([xtl+.5,xtl+.5],[ytl+.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
% line([xtl+.5,xtl+w+.5],[ytl+.5,ytl+.5],'Color','r','LineWidth',1.5)
% line([xtl+.5,xtl+w+.5],[ytl+h+0.5,ytl+h+0.5],'Color','r','LineWidth',1.5)
line([10.5,10.5],[1,25],'Color','r','LineWidth',1.5)
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
print(h1,'..\ronnd_MI_cut.pdf','-dpdf','-r0')

%%

cut = mean(MI(yy1,127:129),2);
err = sqrt(cut.*(1-cut)./36);

prof = [0 0 0 0 0  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0];

h2=figure(1342)

figwidth = fighight*sqrt(2)*1.2;

set(h2, 'Units', 'centimeters')
h2.Position(3) = figwidth;
h2.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

line([0 5.5],[0 0],'LineWidth',1.2,'Color',[0.043,0.353,0.592])

hold on
line([5.5 21.5],[1 1],'LineWidth',1.2,'Color',[0.043,0.353,0.592])
hold off

hold on
line([21.5 25],[0 0],'LineWidth',1.2,'Color',[0.043,0.353,0.592])
hold off

% hold on
% line([21.5 25],[0 0],'LineWidth',1.2,'Color',[0.043,0.353,0.592])
% hold off
% 
% hold on
% line([21.5 21.5],[0 1],'LineWidth',1.2,'Color',[0.043,0.353,0.592])
% hold off

hold on
errorbar(1:length(cut),cut,err,...
    'o','Color',bryg(2,:),'CapSize',0,'LineWidth',1.2,'MarkerFaceColor','w','markers',5)
hold off

box on 

% set(gca,'XScale','log')
xlim([0 26])
% xticks(round(logspace(-.5,3,8)))
% xticklabels({'0','^{1}/_{8}','^{1}/_{4}','^{3}/_{8}'})
xlabel('Site number')

ylim([-0.05 1.05])
yticks([0:0.2:1])
% yticklabels({'0','0.25','0.5','0.75','1'})
ylabel('Mean atom number')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth-left -.15;
ax_height = fighight-bottom;
ax.Position = [left bottom ax_width ax_height];

%%
set(h2, 'PaperUnits', 'centimeters')
h2.PaperPositionMode = 'auto'
h2.PaperSize = [figwidth fighight]
print(h2,'..\MI_cut.pdf','-dpdf','-r0')