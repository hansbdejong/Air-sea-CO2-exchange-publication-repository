% Calculates the lat/lon NCAR wind index numbers for each cruise track 

cd('C:\')

dir_content = dir('C:\*1.*');
A = {dir_content.name};

% provides the index numbers for lat/lon values
% e.g. 
% -69.5217   83
% -71.4262   84
% -73.3307   85

lonKey = xlsread('lonKey.xlsx');
latKey = xlsread('latKey.xlsx');

% loop through each cruise track
for i = 1:21
    B = char(A(i));
    C = xlsread(B);
    
    count = C(:,1);
    julian = C(:,3);
    julian6hourly = C(:,4);
    julian_rounded = C(:,5);
    longitude = C(:,16);
    latitude = C(:,7);
    year = C(:,6);
  
    % loop through each lat/lot pair in a cruise track
    for j = 1:length(longitude)
        
        % vector - calculates the distance between target longitude and all
        % of the longitudes in the lonKey
        diff = abs(longitude(j)-lonKey(:,1));
        
        % returns the closest longitude in the lonKey to the target
        % longitude
        min_diff = min(diff);
        
        % finds the index for that longitude
        index = find(diff == min_diff);
        lonCallNumber = lonKey(index, 2);
        
        % adds that index to the output file
        output_lon(j,1) = lonCallNumber;
    
        % repeats for latitude
        diff = abs(latitude(j)-latKey(:,1));
        min_diff = min(diff);
        index = find(diff == min_diff);
        latCallNumber = latKey(index, 2);
        output_lat(j,1) = latCallNumber;
    end
    
    % prints lat/lon keys
    output = horzcat(count, julian, julian6hourly, julian_rounded, year,...
        longitude, output_lon, latitude, output_lat); 
   
    filename = B(3:7);
    filename = strcat('callNumber_',filename,'.xlsx');
    xlswrite(filename,output)
end


