% extracts the SST data from Terra Nova Bay for each month from Nov
% 2012 through October 2013

cd('C:\')

% sst hdf file
nc = netcdf.open('sst.wkmean.1990-present.nc','NC_NOWRITE');

% indices for SST grid cells that are in Terra Nova Bay
callNumberTNB = xlsread('callNumberTNB.xlsx');

% date indicies from Nov 1 2012 through Oct 31 2013
date = xlsread('dateCallNumberFullYear.xlsx');
dateCallNumber = date(:,3);

% output file
output = zeros(365,6);  

% loop through each lat/lon index
for j = 1:6
    % loop through each day
    for i=1:365
        %lon lat time
        output(i,j) = netcdf.getVar(nc,2,[callNumberTNB(j,3),callNumberTNB(j,4),dateCallNumber(i)]);
    end
end

% unpack data
scale_factor = repmat(0.01, 365, 6);
output = double(output);
sst = output.*scale_factor;

% calculate the mean SST for all the grid cells per day
sst_transpose = sst';
sstTNB = (mean(sst_transpose))';

% write file
filename='sstTNB.xlsx'
xlswrite(filename,sstTNB)
