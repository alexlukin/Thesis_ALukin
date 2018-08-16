data = csvread('melt&back_p1.csv');

h = figure(932528);

figwidth = 9;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

plot(logspace(-1,3,100),repmat(mean(data(1:9,2)),100,1),'--','LineWidth',1.2,'Color',[0.043,0.353,0.592])

hold on
errorbar(data(:,1), data(:,2), data(:,3),'o','Color',[0.043,0.353,0.592],'CapSize',0,'LineWidth',1.2,'MarkerFaceColor','w','markers',5)
hold off

set(gca,'XScale','log')
xlim([3.5*10^-1 .6*10^3])
xticks(round(logspace(-.5,3,8)))
% xticklabels({'0','^{1}/_{8}','^{1}/_{4}','^{3}/_{8}'})
xlabel('Hold time (\it{ms})')

ylim([.5 1.])
yticks([0:0.1:1])
% yticklabels({'0','0.25','0.5','0.75','1'})
ylabel('Probability of one atom per site')

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth-left-.05;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom ax_width ax_height];

%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'..\CBH_melt_and_back_p1.pdf','-dpdf','-r0')