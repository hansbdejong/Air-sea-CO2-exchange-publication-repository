% plots Figure 6, CO2 flux estimates from nutrient budgets

% loads data
cd('C:\')
fid2 = xlsread('1.MATLAB_FCO2_nutrient.xlsx');

lon = fid2(:,3);
fco2 = fid2(:,9)*-1;
error = fid2(:,13);

X = [160 190];
Y = [0 0];


% extracts data from Terra Nova Bay
lon_TNB = fid2(1:4,3);
fco2_TNB = fid2(1:4,9)*-1;
error_TNB = fid2(1:4,13)

% extracts data from North site
lon_north = fid2(5:7,3);
fco2_north = fid2(5:7,9)*-1;
error_north = fid2(5:7,13);

% extracts data from South site
lon_south = fid2(8:12,3);
fco2_south = fid2(8:12,9)*-1;
error_south = fid2(8:12,13);

% extracts data from 76 30 transect
lon_7630 = fid2(13:23,3);
fco2_7630 = fid2(13:23,9)*-1;
error_7630 = fid2(13:23,13);

%##########################################################################
% plots data

% opens figure
figure

plot(X,Y, 'k', 'linewidth', 2)
hold on

% plots error bars
for i = 1:length(lon)
    upper = fco2(i)+error;
    lower = fco2(i)-error;
    lon_temp = lon(i);
    plot([lon_temp lon_temp],[upper lower], 'k', 'linewidth',2)
    hold on
end


scatter(lon_TNB, fco2_TNB, 200,'markerfacecolor','r','MarkerEdgeColor',...
    'k','linewidth',2)
hold on
scatter(lon_south, fco2_south, 200,'markerfacecolor','g',...
    'MarkerEdgeColor','k','linewidth',2)
hold on
scatter(lon_north, fco2_north, 200,'markerfacecolor','b',...
    'MarkerEdgeColor','k','linewidth',2)
hold on
scatter(lon_7630, fco2_7630, 200,'markerfacecolor','k',...
    'MarkerEdgeColor','k','linewidth',2)

ylim([-11 5])
xlim([160 190])
ylabel('mol C m^{-2}', 'fontsize',20)
text(175,3.5,'- [ 7.5 * Def(sN+N) - Def(sDIC) ]', 'fontsize', 20)
set(gca,'FontSize',20)
xlabel(['Longitude [' 176 'E]'],'fontsize',20)
box on
