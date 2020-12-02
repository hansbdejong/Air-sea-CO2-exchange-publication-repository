% adds the FCO2 fluxes for Jan - Mar (only for grids cells where there is
% data for all those months)

% change as appropriate
cd('C:\')

%PLOT spatial FCO2 maps
Jan = xlsread('Jan_FCO2_W14.xlsx');
Feb = xlsread('Feb_FCO2_W14.xlsx');
Mar = xlsread('Mar_FCO2_W14.xlsx');

% loops through the rows
for i = 1:16
    % loops through the columns
    for j = 1:22
        % 31 days in Jan, 28 days in Feb, 31 days in Mar
        temp3 = Jan(i,j)*31;
        temp4 = Feb(i,j)*28;
        temp5 = Mar(i,j)*31;
        
        total = temp3 + temp4 + temp5;
           
        % converts from mmol to mol
        output(i,j) = total/1000;
    end
end

% writes file  
filename = 'fluxes_added.xlsx';
xlswrite(filename, output)
