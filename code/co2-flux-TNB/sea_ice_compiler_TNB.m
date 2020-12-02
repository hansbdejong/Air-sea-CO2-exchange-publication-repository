% extracts the sea ice data from Terra Nova Bay for each month from Nov
% 2012 through October 2013

% change as appropriate
cd('C:\')

% directory of daily sea ice hdf files
dir_content = dir('C:\*asi*');
A = {dir_content.name};

% lat/lon grids
lon=double(hdfread('LongitudeLatitudeGrid-s3125-RossSea.hdf', 'Longitudes'));
lat=double(hdfread('LongitudeLatitudeGrid-s3125-RossSea.hdf', 'Latitudes'));

% loop through each day
for i = 1:length(A)
    init = char(A(i))
    ice = double(hdfread(init, 'ASI Ice Concentration'));
    
    % extract ice data
    iceTNB = ice(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
    lonTNB = lon(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
    latTNB = lat(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
    
    % remove NaNs
    latTNB(isnan(iceTNB)) = [];
    lonTNB(isnan(iceTNB))= [];
    iceTNB(isnan(iceTNB)) = [];
    
    % average concentration
    iceTNB = mean(iceTNB);
    output(i) = iceTNB;
end

% write data
output = output';
filename = 'Sep_ice_TNB.xlsx';
xlswrite(filename,output);