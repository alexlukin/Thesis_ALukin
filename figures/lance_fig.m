figure(313141)
plot(sinc([-1.99:0.01:2].*pi).^2)
% hold on 
% plot(((cos(0.5*pi^2*[-1.99:0.01:2]))).^2)
% hold off
hold on
plot(((1+cos(pi^2*[-1.99:0.01:2]))/2))
hold off
box off
xticks off
