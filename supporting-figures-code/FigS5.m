% plots the maps for Figure S5, Number of days per grid cell with data

% load data
cd('C:\n_days')

Nov = xlsread('Nov_n_days.xlsx');
Dec = xlsread('Dec_n_days.xlsx');
Jan = xlsread('Jan_n_days.xlsx');
Feb = xlsread('Feb_n_days.xlsx');
Mar = xlsread('Mar_n_days.xlsx');

% loads coastline data
cd('C:\m_map_coastlines')

C = xlsread('mainCoastline.xlsx');
LATcoast = C(:,2);
LONcoast = C(:,1);

D = xlsread('island1.xlsx');
LATisland1 = D(:,2);
LONisland1 = D(:,1);

E = xlsread('island2.xlsx');
LATisland2 = E(:,2);
LONisland2 = E(:,1);

F = xlsread('island3.xlsx');
LATisland3 = F(:,2);
LONisland3 = F(:,1);

%##########################################################################
% Plots data

cd('C:\m_map')
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')

% matrix: 16 by 22, the last column and row can have anything
% PLOTS ON THE TOP LEFT corner
Y = linspace(-71,-78.5,16); 
X = [163:2:205];

hold on
m_pcolor(X, Y, Mar);shading flat
h = colorbar;
set(gca, 'CLim', [0 20], 'fontsize', 15);
c = jet(20);
colormap(c);

% plots coastlines
hold on
m_patch(LONcoast, LATcoast,[.85 .85 .85])
hold on
m_patch(LONisland1, LATisland1,[.85 .85 .85])
hold on
m_patch(LONisland2, LATisland2,[.85 .85 .85])
hold on
m_patch(LONisland3, LATisland3,[.85 .85 .85])

m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1);

% adds labels

m_text(167,-78.3,'March','fontsize',25)
m_text(162,-71.5,'(e)','fontsize',25)
m_text(198,-71.5,'[# days]', 'fontsize', 20)
