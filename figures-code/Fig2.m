% plots figure 2, 1302 cruise track

%##########################################################################
% loads data

% change directory: sea ice data
cd('C:\')
Mar12_ice = double(hdfread('asi-AMSR2-s6250-20130312-v5.hdf', 'ASI Ice Concentration'));
lon_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Longitudes'));
lat_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Latitudes'));

% change directory: nutrient data
cd('C:\')
fid2 = xlsread('1.MATLAB_FCO2_nutrient.xlsx');

% TNB
lon_TNB = fid2(1:4,3);
lat_TNB = fid2(1:4,2);

% NORTH SITE
lon_north = fid2(5:7,3);
lat_north = fid2(5:7,2);

% SOUTH hotspot
lon_south = fid2(8:12,3);
lat_south = fid2(8:12,2);

% transect
lon_7630 = fid2(13:23,3);
lat_7630 = fid2(13:23,2);

% change directory: coastline data
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
% plot data

% change directory: M_Map
cd('C:\')
cruise_track = xlsread('track_cruise_last_occupations.xlsx');
lat_cruise_track = cruise_track(:,3);
lon_cruise_track = cruise_track(:,2);

% plot sea ice
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])
h = m_pcolor(lon_ice,lat_ice,Mar12_ice);
set(h, 'EdgeColor', 'none')
mycolor = [0 0 255; 8 48 107; 8	81 156;33 113 181;66 146 198;...
    107	174	214;158	202	225;198	219 239;222	235	247;247	251	255;];
mycolor2 = mycolor/255;
colormap(mycolor2)
h2 = colorbar;
set(get(h2,'title'),'string','Ice Cover [%]               ', 'fontsize', 15);
set(gca, 'CLim', [0 100], 'fontsize', 15);

%plot coastlines
hold on
m_patch(LONcoast, LATcoast,[.85 .85 .85])
hold on
m_patch(LONisland1, LATisland1,[.85 .85 .85])
hold on
m_patch(LONisland2, LATisland2,[.85 .85 .85])
hold on
m_patch(LONisland3, LATisland3,[.85 .85 .85])

% 1000 m isopleth and gridlines
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1.5);
m_grid('linestyle','-','linewidth',1,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')

% plot cruise track and stations
hold on
m_plot(lon_cruise_track,lat_cruise_track,'color',[0.4 0.4 0.4],...
    'linewidth',2)
hold on
m_scatter(lon_north,lat_north,200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','b',...
              'LineWidth',.5)
m_scatter(lon_TNB,lat_TNB,200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',.5)
m_scatter(lon_south,lat_south,200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','g',...
              'LineWidth',.5)   
m_scatter(lon_7630,lat_7630,200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k',...
              'LineWidth',.5)

