P11 = csvread('HOM_p11.csv');
P02 = csvread('HOM_p02.csv');
P20 = csvread('HOM_p20.csv');

options = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0,-Inf,0],...
               'Upper',[0.7,1,Inf,Inf],...
               'StartPoint',[0.5 , 0.5, 0, 1.2]);
fitfunc = fittype('y0 + abs(a/2)*cos(2*pi*(x-x0)/tau)','coeff',{'y0','a','x0','tau'},'options',options);
% fitguess = [0.5*(max(ydata)-min(ydata)) , 0.5*(max(ydata)-min(ydata)), 0, 1];
% [fitted,gof] = fit(xvalues(2:end),ydata(2:end),fitfunc,'StartPoint',fitguess);
[fitted,gof] = fit(P11(:,1),P11(:,2),fitfunc);

params=coeffvalues(fitted);
fitted

fitted2 = fitted;
fitted2.y0 = fitted.y0 /2;
fitted2.a = fitted.a /2;
fitted2.x0 = fitted.tau/2;
fitted2.tau = fitted.tau;

h = figure(45236);

figwidth = 11;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];


fit1 = plot(fitted)
fit1.Color = bryg(1,:);
fit1.LineWidth = 1.2

hold on
fit2 = plot(fitted2)
fit2.Color = bryg(2,:);
fit2.LineWidth = 1.2
hold off

hold on
l1 = errorbar(P11(:,1),P11(:,2),P11(:,3),...
    'd', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(1,:))
hold off

hold on
l2 = errorbar(P02(:,1),P02(:,2),P02(:,3),...
    'o', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(2,:))
hold off
hold on
l3 = errorbar(P20(:,1),P20(:,2),P20(:,3),...
    's', 'CapSize',0,'LineWidth',1.5,'MarkerFaceColor','w','markers',6,'Color',bryg(2,:))
hold off

hold on
plot(repmat(fitted.tau/2,11,1),[0:0.1:1],'--','Color',[0.5 0.5 0.5],'LineWidth', 1.2)
text(fitted.tau/2,0.75,'  BS','Color',[0.5 0.5 0.5])
hold off

xlim([0 2])
xticks([0 fitted.tau/2 fitted.tau fitted.tau*3/2])
xticklabels({'0','^{1}/_{8}','^{1}/_{4}','^{3}/_{8}'})
xlabel('Evolution time (2\pi/\itJ)')

ylim([0 1])
yticks(0:0.25:1)
yticklabels({'0','^{1}/_{4}','^{1}/_{2}','^{3}/_{4}','1'})
ylabel('Probability')

legend([l1 l2 l3],{'P(1,1)', 'P(0,2)','P(2,0)'},'Interpreter','latex','Location','northeast')
legend boxoff

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.1;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom ax_width ax_height];

%%

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'C:\Users\Alex\Documents\Thesis_ALukin\figures\CBH_HOM.pdf','-dpdf','-r0')