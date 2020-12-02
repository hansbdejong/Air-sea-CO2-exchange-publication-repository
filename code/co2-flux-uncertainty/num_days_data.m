% counts the number of days that there is data per monthly grid cell

% change as appropriate
cd('C:\')

% load master data
A = xlsread('MASTER_flux_W14.xlsx');
julian = A(:,1);
year = A(:,2);
FCO2 = A(:,12);
lat = A(:,3);
lon = A(:,4);
mask = xlsread('shelf_mask.xlsx');

% creates day-year timestamps
day = floor(julian)*10000;
timestamp = day + year;  

% lat/lon grid
Y = linspace(-71,-78.5,16); %16
X = [163:2:205]; %22

% Julian days for each month
% Nov 305  335
% Dec 335 366
% Jan 1 32
% Feb 32 60
% March 60 92

% example, March
start = 60;
ending = 92;

% output grid
grid = zeros(15,21);

% loop through each latitude bin
for j = 1:15
    % loop through each longitude bin
    for i = 1:21 
        
        % timestamps for lat/lon grid cell 
        timestamp_section = timestamp(lat <= Y(j) & lat >= Y(j+1) & lon >=  X(i) & lon <= X(i+1)); 
        
        % julian days for lat/lon section
        julian_section = julian(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1)); 
        
        % all the timestamps in the grid cell for specific month
        timestamp_month = timestamp_section(julian_section >= start & julian_section < ending); 
        
        % all the unique day-years in that grid cell
        unique_timestamp = unique(timestamp_month); 
        
        % number of unique days
        grid(j,i) = length(unique_timestamp); 
    end
end

% if there are not data, put NaN in that grid cell
grid(grid == 0) = NaN;

% only keep data on the Ross Sea continental shelf
grid = grid.*mask;

% write data
filename = 'Mar_num_days.xlsx'
xlswrite(filename,grid)