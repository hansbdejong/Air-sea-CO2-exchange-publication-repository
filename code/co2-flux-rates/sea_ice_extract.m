% extracts the sea ice from satellite data for every cruise track (minute
% resolution)

% change as appropriate
cd('C:\')
dir_content = dir('C:\asi*');
A = {dir_content.name};

% fid contains the lat/lon indices. 
fid = xlsread('callNumbers_1.13-2_.xlsx');
count = fid(:,1);
julian = fid(:,2);
row = fid(:,5);
col = fid(:,6);

% This file indicates which counts follow which day
% For example counts 1 (lower_bound) - 172 (upper_bound) occur on Julian 
% day 43, counts 173 - 222 occur on Julian day 44, and so forth
fid2 = xlsread('2.JulianBounds_13-2_.xlsx');
lower_bound = fid2(:,2);
upper_bound = fid2(:,3);

% loop thorugh each day (the daily sea ice data are in order)
for i = 1:length(upperBound)
    init = char(A(i));
    ice = double(hdfread(init, 'ASI Ice Concentration'));
    
    % loops through all the counts for that day, extracts the sea ice from
    % the satellite data file
    for j = lower_bound(i):upper_bound(i) 
        iceOutput(j,1) = count(j);
        iceOutput(j,2) = julian(j);
        iceOutput(j,3) = ice(row(j), col(j));
    end
end

% writes the sea ice data for that cruise tracks. 
filename = 'seaIceOutput.xlsx';
xlswrite(filename, iceOutput);


