data1 = csvread('rms_err_angle_vary_K_0p4pi_randpar_0.csv');
data2 = csvread('rms_err_angle_vary_K_0p4pi_randpar_0p2.csv');
data3 = csvread('rms_err_angle_vary_K_0p4pi_randpar_0p4.csv');
data4 = csvread('rms_err_Kvary_randpar_0p04_anlge_21by50pi.csv');
% fit1 = csvread('..\Data\24sites_fit_2Er.csv');
% fit2 = csvread('..\Data\24sites_fit_3Er.csv');
% fit3 = csvread('..\Data\24sites_fit_4p5Er.csv');

h = figure(4128);

figwidth = 9;
fighight = figwidth/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = 3*figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

% l1 = errorbar(data1(:,1),data1(:,2),data1(:,3),...
%     'o', 'CapSize',0,'LineWidth',2.5,'MarkerFaceColor','w','markers',8,'Color',bryg(1,:));
% 
% hold on 
% l2 = errorbar(data2(:,1),data2(:,2),data2(:,3),...
%     'o', 'CapSize',0,'LineWidth',2.5,'MarkerFaceColor','w','markers',8,'Color',bryg(2,:));
% hold off
% 
% hold on 
% l3 = errorbar(data3(:,1),data3(:,2),data3(:,3),...
%     'o', 'CapSize',0,'LineWidth',2.5,'MarkerFaceColor','w','markers',8,'Color',bryg(3,:));
% hold off
subplot(1,3,1)
hold on
plot(data1(:,2),data1(:,1),'-','Color',bryg(1,:),'LineWidth',1.2)
hold off

hold on
plot(data2(:,2),data2(:,1),'-','Color',bryg(2,:),'LineWidth',1.2)
hold off

hold on
plot(data3(:,2),data3(:,1),'-','Color',bryg(3,:),'LineWidth',1.2)
hold off
box('on')

% uistack(l1,'top');
% uistack(l2,'top');
% uistack(l3,'top');

xlim([0 pi])
xticks([0:pi/4:pi])
xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi'})
xlabel('Grating angle ($rad$)','Interpreter','latex')

ylim([0 .07])
yticks(0:0.02:0.06)
ylabel('RMS error (arb units)','Interpreter','latex')

legend({'$\xi=0$', '$\xi=0.2$', '$\xi=0.4$'},'Interpreter','latex','Location','northwest')
legend boxoff

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.15;
ax_height = fighight-bottom-.05;
ax.Position = [left bottom ax_width ax_height];

subplot(1,3,2)
hold on
xi = 0.00001;
plot([-pi:0.01:pi],0.5*(tanh(([-pi:0.01:pi]+pi/2)/xi) - tanh(([-pi:0.01:pi]-pi/2)/xi)),'Color',bryg(1,:),'LineWidth',1.2) 
hold off

hold on
xi = 0.2;
plot([-pi:0.01:pi],0.5*(tanh(([-pi:0.01:pi]+pi/2)/xi) - tanh(([-pi:0.01:pi]-pi/2)/xi)),'Color',bryg(2,:),'LineWidth',1.2) 
hold off

hold on
xi = 0.4;
plot([-pi:0.01:pi],0.5*(tanh(([-pi:0.01:pi]+pi/2)/xi) - tanh(([-pi:0.01:pi]-pi/2)/xi)),'Color',bryg(3,:),'LineWidth',1.2) 
hold off

box('on')

xlim([-pi pi])
xticks([-pi:pi/2:pi])
xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
xlabel('Phase ($rad$)','Interpreter','latex')

ylim([0 1.05])
yticks([0 0.5 1])
ylabel('Amplitude','Interpreter','latex')

% legend({'$\xi=0$', '$\xi=0.2$', '$\xi=0.4$'},'Interpreter','latex','Location','best')
% legend boxoff

set(gca, 'FontSize', 5, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left_2 = ax.TightInset(1);
bottom_2 = ax.TightInset(2);
ax_width_2 = 2.5;
ax.Position = [((figwidth+left)/2+left_2+0.15) 3.3 ax_width_2 ax_width_2/1.41];

subplot(1,3,3)
plot(data4(:,1),data4(:,2),'-','Color',bryg(1,:),'LineWidth',1.2)

xticks([0.1:.2:0.9])
xticklabels({'10','3.33','2','1.43','1.11'})
xlabel('pix/period','Interpreter','latex')

ylim([0 .07])
% yticks([])
yticks(0:0.02:0.06)
yticklabels({})
% ylabel('RMS error (arb units)','Interpreter','latex')

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.15;
ax_height = fighight-bottom-.05;
ax.Position = [9.5 bottom 4.4 ax_height];


h.Position(3) = 14;
%% saving

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [14 fighight]
print(h,'C:\Users\Alex\Documents\Thesis_ALukin\figures\DMD_K_rotation_v3.pdf','-dpdf','-r0')

