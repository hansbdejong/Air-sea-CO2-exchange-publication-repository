% Plots map inset for Figure 4

% change directory to load data
cd('C:\')
B = xlsread('Instantaneous_FLUX_1302_W14.xlsx');
julian = B(:,1)-1;
FCO2 = B(:,12);
lat = B(:,3);
lon = B(:,4);

% Extracts lat and long from Terra Nova Bay part of cruise track
% 74.5 to 75.4; 163 to 165.5  
FCO2_TNB = FCO2(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
julian_TNB = julian(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
lat_TNB = lat(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
lon_TNB = lon(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);


%##########################################################################
% loads coastline data
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
% plots map

% change to M_Map directory
cd('C:\')
figure('Renderer', 'Painters')
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])

m_scatter(lon,lat,40,'MarkerEdgeColor',[0.85 0.85 0.85],...
              'MarkerFaceColor',[0.85 0.85 0.85],...
              'LineWidth',.5)         
hold on
m_scatter(lon_TNB,lat_TNB,40,'MarkerEdgeColor','r',...
              'MarkerFaceColor','r',...
              'LineWidth',.5)        
hold on
m_patch(LONcoast, LATcoast,[.85 .85 .85])
hold on
m_patch(LONisland1, LATisland1,[.85 .85 .85])
hold on
m_patch(LONisland2, LATisland2,[.85 .85 .85])
hold on
m_patch(LONisland3, LATisland3,[.85 .85 .85])

m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')

m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1);
