data1 = csvread('MI_lifetime.csv');

fitfunc = fittype('y0*exp(-x/a)','coeff',{'y0','a'});
fitguess = [200, 15000];
[fitted,gof] = fit(xdata(pointstofit,1),ydata(pointstofit,1),fitfunc,'StartPoint',fitguess);

h = figure(198);

figwidth = 9;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

xx = 0:1:15000;
plot(xx, fitted.y0.*exp(-xx./fitted.a),'LineWidth',1.2,'Color',bryg(1,:))

hold on
errorbar(data(:,1), data(:,2), data(:,3),'o','Color',[0.043,0.353,0.592],'CapSize',0,'LineWidth',1.2,'MarkerFaceColor','w','markers',5)
hold off

% set(gca,'XScale','log')
xlim([-275 15000])
xticks(0:3000:15000)
xticklabels({'0','3','6','9','12','15'})
xlabel('Hold time (\it{s})')

ylim([50 280])
yticks([0:50:300])
% yticklabels({'0','0.25','0.5','0.75','1'})
ylabel('Atom number')

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1);
bottom = ax.TightInset(2);
ax_width = figwidth-left-.2;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom ax_width ax_height];

%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'..\CTE_lifetime.pdf','-dpdf','-r0')