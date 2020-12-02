% Calculates instantaneous CO2 flux rates for each cruise track

% Change as appropriate
cd('C:\')

dir_content = dir('C:\*1.*');

% directory of each cruise
A = {dir_content.name};

% atmospheric CO2 concentration for each cruise based on South Pole data
pco2_a = xlsread('pco2_atmosphere.xlsx');

% loop through each cruise track
for i = 1:21
    
    % open cruise track file
    B = char(A(i));
    C = xlsread(B);
    julian = C(:,3);
    year = C(:,6);
    latitude = C(:,7);
    longitude = C(:,16);
    SST = C(:,9);
    Sal = C(:,10);
    pco2 = C(:,11);
    wind = C(:,12);
    ice = C(:,15);
    
    % adjust wind to 10 m height
    windAdj = wind*0.91;    
    
    % calculate instantaneous air-sea fluxes
    airsea_flux = co2flux14(pco2,pco2_a(i),windAdj,SST, Sal);
    open_water = (100-ice)./100;
    totalFlux  =  open_water .* airsea_flux;
    
    % write output file
    output = horzcat(julian, year, latitude, longitude, SST, Sal, pco2,...
        wind, ice, windAdj, airsea_flux, totalFlux); 
   
    filename = B(3:7);
    filename = strcat('3.FLUX_WM_',filename,'.xlsx');
    xlswrite(filename,output)
end


