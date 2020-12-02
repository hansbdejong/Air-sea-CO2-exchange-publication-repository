% extracts the NCAR wind data for all the cruise tracks
% the time indices start at 0 in the NCAR hdf files

% change as appropriate
cd('C:\')

% open cruise track file (with the call numbers, i.e. the lat/lon indices)
A = xlsread('callNumber_03-1_.xlsx');
count = A(:,1);
lonCallNumber = A(:,7);
latCallNumber = A(:,9);

% date is the julian 6 hourly, starting at 0
date = A(:,3);

% open wind file for that year
nc_u = netcdf.open('uwnd.10m.gauss.2003.nc','NC_NOWRITE');
nc_v = netcdf.open('vwnd.10m.gauss.2003.nc','NC_NOWRITE');

% extract u wind speed
for i = 1:length(date)
    u_output(i,1) = netcdf.getVar(nc_u,3,[lonCallNumber(i),...
        latCallNumber(i),date(i)]);
end

% extract v wind speed
for i = 1:length(date)
    v_output(i,1) = netcdf.getVar(nc_v,3,[lonCallNumber(i),...
        latCallNumber(i),date(i)]);
end

% calculate actual wind speed
wind = sqrt((u_output.^2)+(v_output.^2));

% write file
filename = 'wind_6hourly_03-1_.xlsx';
output = horzcat(count, date, wind);
xlswrite(filename,output)

