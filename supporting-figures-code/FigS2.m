% Plots Figure S2, pCO2 seasonal cycle in Terra Nova Bay

% loads data
cd('C:\FCO2_TNB')
A = xlsread('TNB_input_v2.xlsx');

cd('C:\pCO2_TNB')
B = xlsread('pCO2_TNB.xlsx');
julian_pco2_smoothed = A(:,1); 
pco2_smoothed = A(:,6);
julian_pco2 = B(:,1);
year_pco2 = B(:,2);
pco2 = B(:,3);

% adjust julian dates - Nov: Oct
for i = 1:length(julian_pco2)
    if julian_pco2(i)<100
        julian_pco2_negative(i) = julian_pco2(i) - 1;
    else
        julian_pco2_negative(i) = julian_pco2(i) - 367;
    end
end

% extract 2013 cruise data
pco2_2013 = pco2(year_pco2 == 2013);
julian_2013 = julian_pco2_negative(year_pco2 == 2013);

%##########################################################################
% plot data
scatter(julian_pco2_negative, pco2, 20, 'markeredgecolor',...
    [0.7 0.7 0.7], 'markerfacecolor', [0.7 0.7 0.7])
hold on
scatter(julian_2013, pco2_2013,20, 'markeredgecolor', 'r',...
    'markerfacecolor', 'r')
hold on
plot(julian_pco2_smoothed, pco2_smoothed, 'color','k', 'linewidth', 3)

ylabel('pCO_{2} [\muatm]', 'fontsize', 15)
box on

% add axes labels
set(gca,'xtick',[-61 -31 0 31 59 90 120 151 181 212 243 273 304],...
    'xticklabel',[], 'fontsize', 13)
xlim([-61 304])
ylim([100 500])

y.loc = 98;
label_size = 10;

text(-46, y.loc, 'N', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(-15.5, y.loc, 'D', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(15.5, y.loc, 'J', 'fontsize',label_size, 'horizontalalignment',...
    'center', 'verticalalignment', 'top')
text(45, y.loc, 'F', 'fontsize',label_size, 'horizontalalignment', ...
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
text(121.5, 75, 'Month', 'fontsize',15, 'horizontalalignment', 'center',...
    'verticalalignment', 'top')

h = legend('all data', 'TRACERS');
set(h, 'fontsize', 15, 'location', 'east')
