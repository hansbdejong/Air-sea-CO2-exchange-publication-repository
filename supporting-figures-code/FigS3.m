% Creates Figure S3, annual sea ice, wind speed, CO2 fluxes, and cumulative
% fluxes in Terra Nova Bay

% load data
cd('C:\FCO2_TNB')
A = xlsread('TNB_input_v2.xlsx');
B = xlsread('FCO2_TNB_v2.xlsx');

cd('C:\FCO2_TNB_NCEP')
C = xlsread('FCO2_TNB_NCEP_v2.xlsx');
D = xlsread('TNB_input_NCEP_v2.xlsx');

%For the Julian dates, Jan 1 starts at 0.
julian_daily = A(:,1); 
julian_8daily = A(:,10);
Sea_ice = A(:,5);
wind_AWS = A(:,4);  
wind_AWS = wind_AWS*0.76;

FCO2_AWS = B(:,4); 
FCO2_AWS_cum = B(:,6);
FCO2_AWS_cum = FCO2_AWS_cum/1000;

julian_4daily = C(:,1);
FCO2_NCEP = C(:,3);
FCO2_NCEP_cum = C(:,5);
FCO2_NCEP_cum = FCO2_NCEP_cum/1000;
wind_NCEP = D(:,4);

%##########################################################################
% plot A - sea ice

axes('Position',[0.25, 0.5, 0.225, 0.375])
plot(julian_daily, Sea_ice, 'k', 'linewidth', 2)
ylabel('% cover', 'fontsize', 15)
box on
text(-45,90, '(a) Sea ice', 'fontsize', 15,'horizontalalignment', 'left')

set(gca,'xtick',[-61 -31 0 31 59 90 120 151 181 212 243 273 304],...
    'xticklabel',[], 'fontsize', 13)
xlim([-61 304])
ylim([0 100])

% axis labels
y.loc = 0;
label_size = 10;

text(-46, y.loc, 'N', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(-15.5, y.loc, 'D', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(15.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(45, y.loc, 'F', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(74.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(105, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(135.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(166, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(196.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(227.5, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(258, y.loc, 'S', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(288.5, y.loc, 'O', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')

%##########################################################################
% Plot B - wind speed

axes('Position',[0.55, 0.5, 0.225, 0.375])
plot(julian_8daily, wind_AWS, 'color',[0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(julian_4daily, wind_NCEP,'-b','linewidth', 2)
ylabel('m s^{-1}', 'fontsize', 15)
box on
text(-45,36.5, '(b) wind speed', 'fontsize', 15,'horizontalalignment', 'left')
set(gca,'xtick',[-61 -31 0 31 59 90 120 151 181 212 243 273 304],...
    'xticklabel',[], 'fontsize', 13)
xlim([-61 304])

% axis labels
y.loc = 0;
label_size = 10;

text(-46, y.loc, 'N', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(-15.5, y.loc, 'D', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(15.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(45, y.loc, 'F', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(74.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(105, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(135.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(166, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(196.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(227.5, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(258, y.loc, 'S', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(288.5, y.loc, 'O', 'fontsize',label_size, 'horizontalalignment', ...
    'center', 'verticalalignment', 'top')

l = legend('AWS', 'NCEP');
set(l, 'fontsize', 10, 'location', 'northeast')


%##########################################################################
% Plot C, CO2 flux rates

axes('Position',[0.25,  0.05, 0.225, 0.375])
plot(julian_8daily, FCO2_AWS, 'color',[0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(julian_4daily, FCO2_NCEP,'-b','linewidth', 2)
ylabel('mmol C m^{-2} d^{-1}', 'fontsize', 15)
text(-45,25, '(c) CO_{2} flux rates', 'fontsize', 15,...
    'horizontalalignment', 'left')
box on
set(gca,'xtick',[-61 -31 0 31 59 90 120 151 181 212 243 273 304],...
    'xticklabel',[], 'fontsize', 13)
set(gca,'ytick',[-200 -100 0])

xlim([-61 304])
ylim([-250 50])

% axis labels
y.loc = -250;
label_size = 10;

text(-46, y.loc, 'N', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(-15.5, y.loc, 'D', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(15.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(45, y.loc, 'F', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(74.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(105, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(135.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(166, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(196.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(227.5, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(258, y.loc, 'S', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(288.5, y.loc, 'O', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')

%##########################################################################
% Plot D, Cumulative CO2 fluxes

axes('Position',[0.55, 0.05, 0.225, 0.375])
plot(julian_8daily, FCO2_AWS_cum, 'color',[0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(julian_4daily, FCO2_NCEP_cum,'-b','linewidth', 2)
ylabel('mol C m^{-2}', 'fontsize', 15)
text(-45,-0.4, '(d)         cumulative CO_{2} fluxes', 'fontsize',...
    15,'horizontalalignment', 'left')
box on
set(gca,'xtick',[-61 -31 0 31 59 90 120 151 181 212 243 273 304],...
    'xticklabel',[],'fontsize', 13)
xlim([-61 304])
ylim([-4.5 0])

% axis labels
y.loc = -4.5;
label_size = 10;

text(-46, y.loc, 'N', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(-15.5, y.loc, 'D', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(15.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(45, y.loc, 'F', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(74.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(105, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(135.5, y.loc, 'M', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(166, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(196.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(227.5, y.loc, 'A', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(258, y.loc, 'S', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(288.5, y.loc, 'O', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
