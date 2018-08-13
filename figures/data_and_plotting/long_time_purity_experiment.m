ent2Er = csvread('2Erpuritydata.csv');
ent1Er = csvread('1Erpuritydata.csv');
ent6Er = csvread('podd_6Er.csv');
ent2Er12 = [[19 35 50 70].*(2*pi*181/1000); 0.4902 0.4783 0.2 0.04; 0.06 0.09 0.09 0.1]';

h=figure(124515)

figwidth = 11;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

errorbar(ent6Er(:,1),1-2.*ent6Er(:,2),2.*ent6Er(:,3),...
    'o','Color',bryg(1,:),'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w')

hold on
errorbar(ent1Er(:,1),1-2.*ent1Er(:,2),2.*ent1Er(:,3),...
    'o','Color',bryg(2,:),'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w')
hold off

hold on
errorbar(ent2Er12(:,1),ent2Er12(:,2),ent2Er12(:,3),...
    'o','Color',bryg(3,:),'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w')
hold off

hold on
semilogx(0.1:1000,linspace(0.49,0.49,length(0.1:1000)),'--','Color',bryg(1,:),'LineWidth',1.2)
hold off

hold on
semilogx(0.1:1000,linspace(0.78,0.78,length(0.1:1000)),'--','Color',[.5 .5 .5],'LineWidth',1.2)
text(4,0.75,'initial state purity','Color',[0.500    0.500    0.500],'FontSize', 8)
hold off
xlabel('Evolution time (2\pi/\itJ)')
ylabel('Purity')
grid off
ylim([-0.1 .9])
xlim([0.2 5*10^2])
set(gca,'XScale','log')
% set(gca,'YScale','log')

legend('6 sites 6Er ', '6 sites 1Er', '12 sites 2Er','short time avarage','Location','southwest')
legend boxoff

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth-left-.25;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom ax_width ax_height];


%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'..\CBH_MBP_vs_time.pdf','-dpdf','-r0')