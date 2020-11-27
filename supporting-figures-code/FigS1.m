% Plots Figure S1, wind speeds in Terra Nova Bay

cd('C:\data')
A = xlsread('MASTER_AWS_winds.xlsx');
C = xlsread('MASTER_TNB_ship_binned.xlsx');
julian_AWS = A(:,1);
wind_AWS = A(:,8);

% correct to 10 m
wind_AWS = wind_AWS*0.76;

julian_ship = C(:,1);
wind_ship = C(:,3);
wind_ship = wind_ship*0.91;


% create plot
plot(julian_AWS, wind_AWS, 'color',[0.7 0.7 0.7], 'linewidth', 2)
hold on
scatter(julian_ship, wind_ship, 50, 'markeredgecolor','r',...
    'markerfacecolor', 'r')
hold on
plot(julian_ship, wind_ship, '-r', 'linewidth', 2)
xlim([40 68])
set(gca,'xtick',[44 48 52 56 60 64],'xticklabel',...
    {'2/13', '2/17','2/21','2/25', '3/1' '3/5'}, 'fontsize', 18)
box on
ylabel('wind speed [m s^{-1}]', 'fontsize', 20)
legend('AWS Manuella', 'Shipboard in TNB')


