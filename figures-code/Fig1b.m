% plots Figure 1b

% change as appropriate
cd('C:\')

% loads cruise track data
A = xlsread('flux.xlsx');
julian = A(:,1);
year = A(:,2);
lat = A(:,3);
lon = A(:,4);

% December only
julian_Dec = julian(julian >= 335 & julian<366);
year_Dec = year(julian >= 335 & julian<366);
lat_Dec = lat(julian >= 335 & julian<366);
lon_Dec = lon(julian >= 335 & julian<366);


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
m_scatter(lon_Dec(year_Dec==2003),lat_Dec(year_Dec==2003),20, ...
    'markerfacecolor', 'k', 'markeredgecolor', 'k')
hold on
m_scatter(lon_Dec(year_Dec==2004),lat_Dec(year_Dec==2004),20, ...
    'markerfacecolor', 'r', 'markeredgecolor', 'r')
hold on
m_scatter(lon_Dec(year_Dec==2005),lat_Dec(year_Dec==2005),20, ...
    'markerfacecolor', 'g', 'markeredgecolor', 'g')
hold on
m_scatter(lon_Dec(year_Dec==2006),lat_Dec(year_Dec==2006),20, ...
    'markerfacecolor', 'b', 'markeredgecolor', 'b')

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
m_text(201.5,-72,'2003','fontsize',18, 'color', 'k', 'verticalalignment', 'top')
m_text(201.5,-72.5,'2004','fontsize',18, 'color', 'r', 'verticalalignment', 'top')
m_text(201.5,-73,'2005','fontsize',18, 'color', 'g', 'verticalalignment', 'top')
m_text(201.5,-73.5,'2006','fontsize',18, 'color', 'b', 'verticalalignment', 'top')
m_text(167,-78.3,'December','fontsize',25)
m_text(162,-71.5,'(b)','fontsize',25)
