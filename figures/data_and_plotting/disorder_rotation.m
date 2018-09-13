angles  = [38.5 39.1 39 40 40.5 39.5]'-39;%.*10^(-3)*2*pi*180;
Podd_rot = [41 34.5 33 41 46 42]'.*10^(-2);
Podd_rot_error = [44 46 40 40 40 48]'.*10^(-3);

depth = [0, 0.3752 2.98 5.946];
podd_W = [.49 .3962 .333 .165];
podd_W_err = [.08307 .08918 .09335 .09718];

h = figure(414238);

figwidth = 14;
fighight = figwidth/sqrt(7);
set(h, 'Units', 'centimeters')
h.Position(3) = figwidth;
h.Position(4) = fighight;
bryg = [0.043,0.353,0.592; 0.729,0.122,0.043; 0.922,0.529,0.008; 0.031,0.545,0.169];

subplot(1,2,1)
errorbar(depth, podd_W, podd_W_err,'o','Color',[0.043,0.353,0.592],'CapSize',0,'LineWidth',1.2,'MarkerFaceColor','w','markers',5)
ylim([0 0.6])
yticks([0:.2:.6])
xlim([-.5 6.5])
xlabel('Potential depth ({\itJ})')
ylabel('State overlap')

set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.15;
ax_height = fighight-bottom-.15;
ax.Position = [left bottom 5.7 ax_height];

subplot(1,2,2)
errorbar(angles, 1-2.*Podd_rot, 2*Podd_rot_error,'o','Color',[0.043,0.353,0.592],'CapSize',0,'LineWidth',1.2,'MarkerFaceColor','w','markers',5)
% hold off
xlabel('Relative angle (deg)')
ylabel('State overlap')

xlim([-.8 1.8])
ylim([0 0.6])
yticks([0:.2:.6])

% grid on


set(gca, 'FontSize', 8, 'LineWidth', 1, 'FontName', 'Arial');

set(gca, 'Units', 'centimeters');
ax = gca;
left = ax.TightInset(1)
bottom = ax.TightInset(2);
ax_width = figwidth-left-.15;
ax_height = fighight-bottom-.15;
ax.Position = [8 bottom 5.7 ax_height];

%% save 
set(h, 'PaperUnits', 'centimeters')
h.PaperPositionMode = 'auto'
h.PaperSize = [figwidth fighight]
print(h,'..\CBH_pattern_rotation.pdf','-dpdf','-r0')