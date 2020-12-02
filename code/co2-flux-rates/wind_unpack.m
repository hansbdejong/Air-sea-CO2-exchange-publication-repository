% extracts the wind (and salinity) data from the JGOFS minute binned files,
% creates a timestamp to then merge the JGOFS data with the Lamont pCO2
% data

% change as appropriate
cd('C:\')
dir_content  =  dir('C:\*.dat*');
A  =  {dir_content.name};

% loop through the daily JGOFS files
for i = 1:length(A)
    init = char(A(i));
    fid = fopen(init);
    data = textscan(fid,...
        '%s %s %f %f %f %s %s %s %s %f %s %f %f %f %s %s %s %s %s %s %s %s',...
        'headerlines', 0);

    date = char(data{1});
    time = char(data{2});

    lat = data{3};
    lon = data{4};
    shipSpeed = data{5};
    temp = data{10};
    sal = data{12};
    depth = data{13};
    wind = data{14};
    julian = repmat(str2num(init(3:5)),length(time),1);

    % creates the timestamp
    year = date(:,7:8);
    decade = repmat(20,length(year),1);
    year = strcat(num2str(decade), num2str(year));
    month = date(:,4:5);
    day = date(:,1:2);
    hour = time(:,1:2);
    minute = time(:,4:5);
    timestamp = strcat(year, month, day, hour, minute);
    timestamp = str2num(timestamp);

    % writes out the extracted data
    filename = strcat('1.',init(1:5),'.xlsx');
    output = horzcat(timestamp, julian, lat, lon, shipSpeed, temp,...
        sal, depth, wind);
    xlswrite(filename,output)

end