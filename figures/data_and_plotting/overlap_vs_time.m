load('overlap_vs_time.mat');

h = figure(9358);

figwidth = 9;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

ll = cell(4,1);
cc = [4 3 2 1];
for ii = 1:4
    hold on
    fit1 = plot(xdata{1},ydata{ii})
    fit1.Color = bryg(cc(ii),:);
    fit1.LineWidth = 1.2
    ll{ii} = fit1;
    hold off
end

% hold on
% fit2 = plot(fitted2)
% fit2.Color = bryg(2,:);
% fit2.LineWidth = 1.2
% hold off
% 
% hold on
% l1 = errorbar(P11(:,1),P11(:,2),P11(:,3),...
%     'd', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(1,:))
% hold off
% 
% hold on
% l2 = errorbar(P02(:,1),P02(:,2),P02(:,3),...
%     'o', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(2,:))
% hold off
% hold on
% l3 = errorbar(P20(:,1),P20(:,2),P20(:,3),...
%     's', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(2,:))
% hold off
% 
% hold on
% plot(repmat(fitted.tau/2,11,1),[0:0.1:1],'--','Color',[0.5 0.5 0.5],'LineWidth', 1.2)
% text(fitted.tau/2,0.75,'  BS','Color',[0.5 0.5 0.5])
% hold off

set(gca,'XScale','log')
xlim([10^-1 10^5])
xticks(logspace(0,5,6))
% xticklabels({'0','^{1}/_{8}','^{1}/_{4}','^{3}/_{8}'})
xlabel('Evolution time (2\pi/\itJ)')

ylim([-0.03 1.03])
yticks(0:0.25:1)
yticklabels({'0','0.25','0.5','0.75','1'})
ylabel('State overlap')

legend([ll{4} ll{3} ll{2} ll{1}],{'$\epsilon = 0$', '$\epsilon = 10^{-4}$','$\epsilon = 10^{-3}$','$\epsilon = 10^{-2}$'},...
    'Interpreter','latex','Location','southwest')
legend boxoff

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.25;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom ax_width ax_height];

%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'..\CBH_overlap.pdf','-dpdf','-r0')