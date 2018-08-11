h = figure(426778);

figwidth = 9;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

xx = [-2:.001:2];
dw = @(x) 1.7.*(exp(-((xx-1.5)./.95).^2)+exp(-((xx+1.5)./.95).^2) - 0.5.*exp(-((xx)./.9).^2)).^2;
plot(xx, 2.*cos(pi*xx).^2,'--','Color',[0.5 0.5 0.5],'LineWidth', 1.2)

hold on
plot(xx,dw(xx),'-','Color',bryg(1,:),'LineWidth', 1.2)
hold off

hold on
plot(xx,dw(xx)+2.*cos(pi*xx).^2,'-','Color',[0 0 0],'LineWidth', 1.2)
hold off

ylim([0 3.1])
yticks(0:1:3)
yticklabels({'0','1','2','3'})
ylabel('Depth (\it{Er})')

xlim([-2 2])
xticks([-1.5:1:1.5])
% xticklabels({'0','^{1}/_{8}','^{1}/_{4}','^{3}/_{8}'})
xlabel('Distance (\it{lattice sites})')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.1;
ax_height = fighight-bottom-.05;
ax.Position = [left bottom ax_width ax_height];

%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'C:\Users\Alex\Documents\Thesis_ALukin\figures\CBH_DW.pdf','-dpdf','-r0')