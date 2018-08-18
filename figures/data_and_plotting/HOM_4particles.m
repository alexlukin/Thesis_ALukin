data = csvread('HOM_4particles.csv');
theory = csvread('HOM_4particles_theory.csv');

h = figure(98);

figwidth = 7;
fighight = 9/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

b1 = bar([-4 -2 0 2 4],theory,'FaceColor',bryg(1,:))
b1.BarWidth = .5

hold on
errorbar([-4 -2 0 2 4], data(:,1), data(:,2),'o','Color',bryg(2,:),'CapSize',0,'LineWidth',2,'MarkerFaceColor','w','markers',5)
hold off

% set(gca,'XScale','log')
% xlim([3.5*10^-1 .6*10^3])
xticks([-4 -2 0 2 4])
xticklabels({'(4;0)','(3;1)','(2;2)','(1;3)','(0;4)'})
% xlabel('Hold time (\it{ms})')

% ylim([.5 1.])
yticks([0:0.1:1])
% yticklabels({'0','0.25','0.5','0.75','1'})
ylabel('Probability')

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
print(h,'..\CBH_HOM_4particles.pdf','-dpdf','-r0')