% plots figure 4, instantaneous fluxes

% change directory to obtain data
cd('C:\')

% loads instantaneous flux data
B = xlsread('Instantaneous_FLUX_1302_W14.xlsx');
julian = B(:,1)-1;
fco2 = B(:,12);
lat = B(:,3);
lon = B(:,4);
wind_adj = B(:,10);
pco2 = B(:,7);

% Extracts data from Terra Nova Bay - 74.5 to 75.4; 163 to 165.5  
fco2_TNB = fco2(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
julian_TNB = julian(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
wind_TNB = wind_adj(lat <=  -74.5 & lat >=  -75.4 & lon >= 163 & lon <= 165.5);
pco2_TNB = pco2(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);

X = -56:1:90;
Y = 56:-2:-150;

for_pcolor = xlsread('pcolorInput2.xlsx');
mean_fco2 = xlsread('meanFlux.xlsx');

%##########################################################################
% Plot Figure a
axes('Position',[0.25, 0.5125, 0.5, 0.3875])
plot([-61 90], [0 0], '-k')
hold on
plot(julian,fco2,'ok', 'markeredgecolor', [0.7 0.7 0.7],...
    'markerfacecolor', [0.7 0.7 0.7], 'markersize', 4)
hold on
plot(julian_TNB,fco2_TNB,'or','markeredgecolor', 'r', 'markerfacecolor',...
    'r', 'markersize', 4)

xlim([-61 90])
ylim([-250 50])
ylabel('mmol C m^{-2} d^{-1}', 'fontsize',15)
set(gca,'ytick',[ -200  -100  0])
set(gca,'FontSize',13)
box on
set(gca,'xtick',[-61 -31 0 31 59 90],'xticklabel',[])
text(-60, 25, '(a)', 'fontsize',15)

%##########################################################################
% Plot Figure 4b
s2 = axes('Position',[0.25, 0.1, 0.5, 0.3875]);
plot([-61 90], [0 0], '-k')
hold on
pcolor(X,Y,for_pcolor); shading flat
s2Pos  =  get(s2,'position');
h = colorbar;
set(s2,'position',s2Pos);
set(gca, 'CLim', [0 100], 'fontsize', 10);
title(h,'Count', 'fontsize', 13)
hold on
plot(mean_fco2(:,1), mean_fco2(:,2), '-k', 'linewidth', 2)
xlim([-61 90])
ylim([-250 50])
ylabel('mmol C m^{-2} d^{-1}', 'fontsize',15)
set(gca,'FontSize',13)
set(gca,'ytick',[ -200  -100  0])
box on
set(gca,'xtick',[-61 -31 0 31 59 90],'xticklabel',[])
y.loc = -250;
label_size = 15;

text(-46, y.loc, 'Nov', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'bottom')
text(-15.5, y.loc, 'Dec', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'bottom')
text(15.5, y.loc, 'Jan', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'bottom')
text(45, y.loc, 'Feb', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'bottom')
text(74.5, y.loc, 'Mar', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'bottom') 
text(-60, 25, '(b)', 'fontsize',15)
