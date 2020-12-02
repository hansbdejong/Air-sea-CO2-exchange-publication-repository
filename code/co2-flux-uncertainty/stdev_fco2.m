% calculates the standard deviation of the mean FCO2 values for each unique
% day (per month grid cell)

% change as appropriate
cd('C:\')

% opens master file
A = xlsread('MASTER_flux_W14.xlsx');
julian = A(:,1);
year = A(:,2);
FCO2 = A(:,12);
lat = A(:,3);
lon = A(:,4);

% creates timestamp - day/year, e.g. 812013 (Julian = 81, year = 2013)
day = floor(julian)*10000;
timestamp = day + year; 

% masks all bins that are not on the Ross Sea Continental Shelf
mask = xlsread('shelf_mask.xlsx');

% lat/lon grids
% 0.5 degree lat
% 15 bins
Y = linspace(-71,-78.5,16); 

% every 2 degrees lon
% 21 bins
X = [163:2:205]; 

% Julian day month bands - Nov through March
start = [305 335 1 32 60]; 
ending = [335 366 32 60 92];
names = {'Nov' 'Dec' 'Jan' 'Feb' 'Mar'};
averages = zeros(5,1);

for month = 1:5
    % output grid for the averages for each lat/lon bin
    FCO2_mean = zeros(15,21);
    
    % output grid for the standard deviation for each lat/lon bin
    FCO2_std = zeros(15,21);
    
    % loops through each latitude bin
    for j=1:15
        % loops through each longitude bin
        for i = 1:21
         
            % extract grid data
            FCO2_section = FCO2(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1));
            julian_section = julian(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1));
            year_section = year(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1));
            timestamp_section = timestamp(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1));
            
            % extract data from that grid cell for specific month
            
            % FCO2 from specific grid and specific month
            FCO2_month = FCO2_section(julian_section >= start(m) & julian_section < ending(m)); 
            
            % years where FCO2 data collected
            year_month = year_section(julian_section >= start(m) & julian_section < ending(m));
            timestamp_month = timestamp_section(julian_section >= start(m) & julian_section < ending(m));
            
            % list of unique day-years for that month in that grid cell
            unique_timestamp = unique(timestamp_month); 
            
            % list of unique years for that month in that grid cell
            unique_year = unique(year_month);

             % average FCO2 for each unique day 
            for k = 1:length(unique_timestamp)  
                
                % the FCO2 values for that unique day
                FCO2_temp = FCO2_month(timestamp_month == unique_timestamp(k));
                
                % the year of that unique day
                year_temp = year_month(timestamp_month == unique_timestamp(k));
                
                % the mean FCO2 for that day
                FCO2_mean_temp_1(k) = mean(FCO2_temp);
                
                % the year of that unique day
                year_temp_mean_1(k) = mean(year_temp);
                
                % the day-year time stamp for that unique day
                unique_timestamp_temp_1(k) = unique_timestamp(k);
            end
            
            % mean of the unique day FCO2s
            FCO2_mean(j,i) = mean(FCO2_mean_temp_1); 
            
            % std of of the unique day FCO2s
            FCO2_std(j,i) = std(FCO2_mean_temp_1); 
            
        end
    end
    
    FCO2_mean = FCO2_mean.*mask;
    FCO2_std = FCO2_std.*mask;
    
    filename1 = strcat(names(m), '_mean_unique_days_fco2.xlsx');
    filename1 = char(filename1);
    xlswrite(filename1,FCO2_mean)   
    
    filename2 = strcat(names(m), '_stdev_unique_days_fco2.xlsx');
    filename2 = char(filename2);
    xlswrite(filename2, FCO2_std)
    
end
