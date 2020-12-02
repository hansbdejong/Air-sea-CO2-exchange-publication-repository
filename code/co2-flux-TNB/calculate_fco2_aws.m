% calculates CO2 fluxes every three hours from Nov 1 2012 till Oct 31 2013
% in Terra Nova Bay using the Automatic Weather Stations wind data. 

% change as appropriate
cd('C:\')

% load data
fid = xlsread('TNB_input.xlsx');
julian = fid(:,3);
SST = fid(:,7);
pco2 = fid(:,6);
wind = fid(:,4);

% adjust to 10 m height
windAdj = wind * 0.76;
ice = fid(:,5);
 
airsea_flux = co2flux14(pco2,391,windAdj,SST, 34.5);
open_water = (100-ice)./100;
totalFlux = open_water .* airsea_flux;
    
output = horzcat(julian, airsea_flux, totalFlux); 
   
filename = 'FCO2_TNB.xlsx'
xlswrite(filename,output)