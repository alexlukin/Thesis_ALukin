data1 = csvread('rms_err_Kvary_randpar_0p04_anlge_21by50pi.csv');
% data2 = csvread('rms_err_angle_vary_K_0p4pi_randpar_0p2.csv');
% data3 = csvread('rms_err_angle_vary_K_0p4pi_randpar_0p4.csv');
% fit1 = csvread('..\Data\24sites_fit_2Er.csv');
% fit2 = csvread('..\Data\24sites_fit_3Er.csv');
% fit3 = csvread('..\Data\24sites_fit_4p5Er.csv');

h = figure(4129);

figwidth = 5;
fighight = 9/sqrt(2);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
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


plot(data1(:,1),data1(:,2),'-','Color',bryg(1,:),'LineWidth',1.2)


% uistack(l1,'top');
% uistack(l2,'top');
% uistack(l3,'top');

% xlim([0 pi])
xticks([0.1:.2:0.9])
xticklabels({'10','3.33','2','1.43','1.11'})
xlabel('pix/period','Interpreter','latex')

ylim([0 .07])
yticks(0:0.02:0.06)
ylabel('RMS error (arb units)','Interpreter','latex')

% legend({'$\xi=0$', '$\xi=0.2$', '$\xi=0.4$'},'Interpreter','latex','Location','northwest')
% legend boxoff

box('on')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.15;
ax_height = fighight-bottom-.05;
ax.Position = [left bottom ax_width ax_height];

%%
data2 = 'hologram_35.csv';
h2 = figure(31562)
imagesc(Z1(143:270,20:180))
colormap gray

set(h2, 'Units', 'centimeters')
h2.Position(3) = 10;
h2.Position(4) = 10;
%% saving

set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'C:\Users\Alex\Documents\Thesis_ALukin\figures\DMD_K_vary.pdf','-dpdf','-r0')

