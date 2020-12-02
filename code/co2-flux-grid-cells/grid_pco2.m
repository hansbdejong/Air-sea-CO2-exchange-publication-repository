% bins pCO2 into lat and lon grids

% change as appropriate
cd('C:\')

% opens master file
A = xlsread('MASTER_flux_W14.xlsx');
julian = A(:,1);
year = A(:,2);
pCO2 = A(:,7);
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

% loops through each month
for month = 1:5
    % output grid for the averages for each lat/lon bin
    grid = zeros(15,21);
    
    % loops through each latitude bin
    for j = 1:15
        % loops through each longitude bin
        for i = 1:21

            % extract grid data
            pCO2_section = pCO2(lat <=  Y(j) & lat >= Y(j+1) & lon >=  X(i) & lon <= X(i+1));
            julian_section = julian(lat <=  Y(j) & lat >=  Y(j+1) & lon >=  X(i) & lon <= X(i+1));
            year_section = year(lat <=  Y(j) & lat >=  Y(j+1) & lon >= X(i) & lon <= X(i+1));
            timestamp_section = timestamp(lat <= Y(j) & lat >= Y(j+1) & lon >= X(i) & lon <= X(i+1));
            
            % extract data from that grid cell for specific month
            
            %pCO2 from specific grid and specific month
            pCO2_month = pCO2_section(julian_section >= start(month) & julian_section < ending(month)); 
            
            %years where pCO2 data collected
            year_month = year_section(julian_section >= start(month) & julian_section < ending(month));
            timestamp_month = timestamp_section(julian_section >= start(month) & julian_section < ending(month));
            
            % list of unique day-years for that month in that grid cell
            unique_timestamp = unique(timestamp_month); 
            
            % list of unique years for that month in that grid cell
            unique_year = unique(year_month);
            
            % average pCO2 for each unique day 
            for k = 1:length(unique_timestamp)  
               
                % the pCO2 values for that unique day
                pCO2_temp = pCO2_month(timestamp_month == unique_timestamp(k));
                
                % the year of that unique day
                year_temp = year_month(timestamp_month == unique_timestamp(k));
                
                % the mean pCO2 for that day
                pCO2_mean_temp_1(k) = mean(pCO2_temp);
                
                % the year of that unique day
                year_temp_mean_1(k) = mean(year_temp);
                
                % the day-year time stamp for that unique day
                unique_timestamp_temp_1(k) = unique_timestamp(k);
            end
            
            % finds the average pCO2 for each unique year - averages the
            % daily averages for that year
            for k = 1:length(unique_year) 
                
                % pCO2 daily averages for that year
                pCO2_temp = pCO2_mean_temp_1(year_temp_mean_1 == unique_year(k));
                
                % averages the daily averages for that year
                pCO2_mean_temp_2(k) = mean(pCO2_temp);
                
                % year for the average of daily averages
                year_temp_mean_2(k) = unique_year(k);
            end
            
            % mean of the yearly means
            grid(j,i) = mean(pCO2_mean_temp_2);        
        end
    end
    
    % outputs file for that month
    grid = grid.*mask;
    filename = strcat(names(month), '_pCO2_W14_Shelf.xlsx');
    filename = char(filename);
    xlswrite(filename, grid);
    
    % calculates the average of all grid cells for that month
    grid(isnan(grid)) = [];
    averages(m, 1) = mean(grid);
end
