% extract 6 hourly wind from Terra Nova Bay (2 grid cells) for each month from 
% Nov 2012 through October 2013

% change as appropriate
cd('C:\')
nc2012u = netcdf.open('uwnd.10m.gauss.2012.nc','NC_NOWRITE');
nc2012v = netcdf.open('vwnd.10m.gauss.2012.nc','NC_NOWRITE');
nc2013u = netcdf.open('uwnd.10m.gauss.2013.nc','NC_NOWRITE');
nc2013v = netcdf.open('vwnd.10m.gauss.2013.nc','NC_NOWRITE');

ncdisp('uwnd.10m.gauss.2012.nc','uwnd')
ncdisp('uwnd.10m.gauss.2013.nc','uwnd')

% lat/lon indices for TNB (only 2)
call = xlsread('callNumbersTNB.xlsx');

%##########################################################################
% u2012
u2012 = zeros(1464,2); 

%loop through the year (6 hourly)
for j = 1:1464
    % loop through the 2 grid cells
    for i = 1:2
        u2012(j,i) = netcdf.getVar(nc2012u,3,[call(i,3),call(i,4),(j-1)]);
    end
end


%##########################################################################
% v 2012

v2012 = zeros(1464,2);  
for j = 1:1464
    for i = 1:2
        v2012(j,i) = netcdf.getVar(nc2012v,3,[call(i,3),call(i,4),(j-1)]);
end
end

% actual wind speeds
wind2012TNB = sqrt((u2012.^2)+(v2012.^2));
wind2012TNB = wind2012TNB';
wind2012TNB = (mean(wind2012TNB))';

% write data
filename = 'wind2012TNB.xlsx';
xlswrite(filename,wind2012TNB)

%##########################################################################
% u2013

u2013 = zeros(1460,2);  
for j = 1:1460
    for i = 1:2
        u2013(j,i) = netcdf.getVar(nc2013u,3,[call(i,3),call(i,4),(j-1)]);
    end
end


%##########################################################################
% v2013

v2013 = zeros(1460,2);  
for j = 1:1460
    for i = 1:2
        v2013(j,i) = netcdf.getVar(nc2013v,3,[call(i,3),call(i,4),(j-1)]);
    end
end

% actual wind speeds
wind2013TNB = sqrt((u2013.^2)+(v2013.^2));
wind2013TNB = (mean(wind2013TNB'))'

% write data
filename = 'wind2013TNB.xlsx'
xlswrite(filename,wind2013TNB)