% plots Figure 1d

% change as appropriate
cd('C:\')

% loads cruise track data
A = xlsread('flux.xlsx');
julian = A(:,1);
year = A(:,2);
lat = A(:,3);
lon = A(:,4);

julian_Feb=julian(julian>=32 & julian<60)
year_Feb=year(julian>=32 & julian<60)
lat_Feb=lat(julian>=32 & julian<60)
lon_Feb=lon(julian>=32 & julian<60)

%##########################################################################
% change to directory with coastline data
cd('C:\')

% load land data
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

% change do directory with M_Map mapping package

cd('C:\')

% creates plot
figure('Renderer', 'Painters')
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')
hold on
m_scatter(lon_Feb(year_Feb==2004),lat_Feb(year_Feb==2004), 20,...
    'markerfacecolor', 'r', 'markeredgecolor', 'r')
hold on
m_scatter(lon_Feb(year_Feb==2005),lat_Feb(year_Feb==2005), 20,...
    'markerfacecolor', 'g', 'markeredgecolor', 'g')
hold on
m_scatter(lon_Feb(year_Feb==2006),lat_Feb(year_Feb==2006), 20,...
    'markerfacecolor', 'b', 'markeredgecolor', 'b')
hold on
m_scatter(lon_Feb(year_Feb==2007),lat_Feb(year_Feb==2007), 20,...
    'markerfacecolor', 'k', 'markeredgecolor', 'k')
hold on
m_scatter(lon_Feb(year_Feb==2008),lat_Feb(year_Feb==2008), 20,...
    'markerfacecolor', 'c', 'markeredgecolor', 'c')
hold on
m_scatter(lon_Feb(year_Feb==2011),lat_Feb(year_Feb==2011), 20,...
    'markerfacecolor', 'm', 'markeredgecolor', 'm')
hold on
m_scatter(lon_Feb(year_Feb==2013),lat_Feb(year_Feb==2013), 20,...
    'markerfacecolor', [0 0.4 0], 'markeredgecolor', [0 0.4 0])

% adds land
hold on
m_patch(LONcoast, LATcoast,[.85 .85 .85])
hold on
m_patch(LONisland1, LATisland1,[.85 .85 .85])
hold on
m_patch(LONisland2, LATisland2,[.85 .85 .85])
hold on
m_patch(LONisland3, LATisland3,[.85 .85 .85])

% 1000 m isopleth
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1);

% adds labels
m_text(201.5,-72,'2004','fontsize',18, 'color', 'r', 'verticalalignment', 'top')
m_text(201.5,-72.5,'2005','fontsize',18, 'color', 'g', 'verticalalignment', 'top')
m_text(201.5,-73,'2006','fontsize',18, 'color', 'b', 'verticalalignment', 'top')
m_text(201.5,-73.5,'2007','fontsize',18, 'color', 'k', 'verticalalignment', 'top')
m_text(201.5,-74,'2008','fontsize',18, 'color', 'c', 'verticalalignment', 'top')
m_text(201.5,-74.5,'2011','fontsize',18, 'color', 'm', 'verticalalignment', 'top')
m_text(201.5,-75,'2013','fontsize',18, 'color', [0 0.4 0], 'verticalalignment', 'top')

m_text(167,-78.3,'February','fontsize',25)
m_text(162,-71.5,'(d)','fontsize',25)


