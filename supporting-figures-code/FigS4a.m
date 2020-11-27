% Plots Figure S4A

% loads data
cd('C:\pco2_data_neural_networks')
fco2 = xlsread('fco2_RS_mmap.xlsx');

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
% plots map

cd('C:\\m_map')
figure('Renderer', 'Painters')
m_proj('mercator', 'lon', [160 205], 'lat', [-79 -71])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'fontsize',15,...
'color','k')

Y = [-70:-1:-78]; 
X = [163:1:205]; 

hold on
m_pcolor(X, Y, fco2);shading flat
c = jet(18)
colormap(c(3:17, :));
h = colorbar
set(gca, 'CLim', [-1 0.5], 'fontsize', 15);

% adds coastlines

hold on
m_patch(LONcoast, LATcoast,[.85 .85 .85])
hold on
m_patch(LONisland1, LATisland1,[.85 .85 .85])
hold on
m_patch(LONisland2, LATisland2,[.85 .85 .85])
hold on
m_patch(LONisland3, LATisland3,[.85 .85 .85])

m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1);
m_text(196,-71.5,'[mol C m^{-2} yr^{-1}]', 'fontsize', 15)
m_text(162,-71.5,'(a)','fontsize',25)

