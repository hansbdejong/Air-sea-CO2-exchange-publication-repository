% creates a date index from 0 to 365*4 (since the NCEP wind data is
% 6-hourly). The time indices in the NCAR hdf files start at 0. 

% change as appropriate
cd('C:\')
dir_content = dir('C:\*1.*');
A = {dir_content.name};

% loop thorough all the cruise tracks
for i = 1:21
    B = char(A(i));
    C = xlsread(B);
    count = C(:,1);
    julian = C(:,3);
    
    % julian floor (e.g. 321.8 = 321)
    julian_floor = C(:,4);
    
    % starts at zero, increases by 1 every 6 hours
    addThis = floor((julian-julian_floor) * 4);
    julian_6hourly = ((julian_floor - 1) * 4) + addThis;
    
    % output file
    output2 = horzcat(count, julian, julian_rounded, julian_6hourly); 
    filename = B(3:7);
    filename = strcat('Julian6hourly_',filename,'.xlsx');
    xlswrite(filename,output2)
end


