% creates figure 3, Jan through March CO2 fluxes

% changes directory to data directory
cd('C:\')

% loads data
FCO2 = xlsread('fluxesAdded_v3.xlsx');
mask = xlsread('shelf_mask_v2.xlsx');
FCO2 = FCO2.*mask;

%##########################################################################
% loads coastline data

% changes directory to obtain coastline data
cd('C:\')

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
% plots figure

% change directory to M-Map
cd('C:\')

figure('Renderer', 'Painters')
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])

m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')

% creates grid to plot
% matrix: 16 by 22, the last column and row can have anything
% plots ON THE TOP LEFT corner
Y = linspace(-71,-78.5,16); 
X = [163:2:205]; 

hold on
m_pcolor(X, Y, FCO2);shading flat
c = jet(20);
colormap(c(1:20,:));
h = colorbar;
set(gca, 'CLim', [-5 0], 'fontsize', 15);

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

% labels plot
m_text(196,-71.5,'[mol C m^{-2}]', 'fontsize', 20)


