% extracts the wind data from the ship in Terra Nova Bay to calibrate land
% autonomous wind sensors

% bins the wind into 3 hour intervals that can then be linked to the 3
% hourly AWS wind. 

% change as appropriate
cd('C:\')

% loads wind data from Ross Sea
A = xlsread('NBP1302_wind_73.xlsx');
day = A(:,1);
year = A(:,2);
lat = A(:,7);
lon = A(:,8);
wind = A(:,9);

%TNB --  74.5 to 75.4; 163 to 165.5  
% extracts wind data from Terra Nova Bay

wind_TNB = wind(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
day_TNB = day(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);

% bins the julian days into 3 hourly to be able to merge with the AWS data
floor_day_TNB = floor(day_TNB);
decimal = day_TNB - floor_day_TNB;
decimal(decimal >= 0 & decimal < 0.125) = 0;
decimal(decimal >= 0.125 & decimal < 0.25) = 0.125;
decimal(decimal >= 0.25 & decimal < 0.375) = 0.25;
decimal(decimal >= 0.375 & decimal < 0.5) = 0.375;
decimal(decimal >= 0.5 & decimal < 0.625) = 0.5;
decimal(decimal >= 0.625 & decimal < 0.75) = 0.625;
decimal(decimal >= 0.75 & decimal < 0.875) = 0.75;
decimal(decimal >= 0.875) = 0.875;

day_TNB_3hourly = floor_day_TNB + decimal;
output = horzcat(day_TNB_3hourly, day_TNB, wind_TNB);

filename = 'wind_TNB.xlsx';
xlswrite(filename, output)

% bins the wind data
binned_wind = grpstats(output, output(:,1));
filename='wind_TNB_binned_3hourly'
xlswrite(filename, binned_wind)
