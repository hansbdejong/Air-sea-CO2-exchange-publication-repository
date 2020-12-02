% calculates CO2 fluxes every three hours from Nov 1 2012 till Oct 31 2013
% in Terra Nova Bay using the NCEP wind data. 

% change as appropriate
cd('C:\')

% loads data
fid = xlsread('TNB_input.xlsx');
julian = fid(:,3);
SST = fid(:,7);
pco2 = fid(:,6);
wind = fid(:,4);
ice = fid(:,5);
 
airsea_flux = co2flux14(pco2,391,wind,SST, 34.5);
open_water = (100-ice)./100;
totalFlux = open_water .* airsea_flux;
    
output = horzcat(julian, totalFlux); 
filename = 'FCO2_TNB_NCEP.xlsx';
xlswrite(filename,output)
  
