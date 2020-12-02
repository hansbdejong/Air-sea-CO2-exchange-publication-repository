% extracts the pCO2 data from Terra Nova Bay then bins it into daily
% averages

cd('C:\')

A = xlsread('pCO2merged.xlsx');
day = A(:,3);
year = A(:,4);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);


% TNB: 74.5 to 75.4; 163 to 165.5  
pCO2_section = pCO2(lat <=  -74.5 & lat >=  -75.4 & lon >=  163 & lon <= 165.5);
day_section = day(lat <=  -74.5 & lat >=  -75.4 & lon >=  163 & lon <= 165.5);
year_section = year(lat <= -74.5 & lat >= -75.4 & lon >=  163 & lon <= 165.5);

output = horzcat(day_section, year_section, pCO2_section);
filename = 'pco2_TNB.xlsx'
xlswrite(filename, output)

% bins the pCO2 data by day
output2 = grpstats(output, output1(:,1));

filename='pco2_TNB_binned'
xlswrite(filename,outputs)
