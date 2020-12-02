% calculates the standard error for FCO2 measurements

% change as appropriate
cd('C:\')

stdev_list = dir('*stdev*');
stdev_list = {stdev_list.name};
n_day_list = dir('*n_days*');
n_day_list = {n_day_list.name};
fco2_list = dir('*W14*');
fco2_list = {fco2_list.name};

% loop through each month
for i = 1:5  
    stdev_i = xlsread(char(stdev_list(i)));
    n_day_i = xlsread(char(n_day_list(i)));
    fco2 = xlsread(char(fco2_list(i)));
    
    % calculate average standard deviation for that month
    stdev_i_list = stdev_i;
    n_day_i_list = n_day_i;
    
    % remove all of the NaNs in order to calculate mean standard deviation
    stdev_i_list(isnan(stdev_i_list)) = [] ;       
    n_day_i_list(isnan(n_day_i_list)) = [];
    
    % if there is only 1 day of data, remove data (not possible to calculate
    % standard deviation)
    stdev_i_list(n_day_i_list == 1) = [];            
    
    % prints into console
    % average standard deviation for that month
    char(A(i))
    average_i = mean(stdev_i_list);                 
    
    
    % Calculate the standard error. If there is only one measurement, set 
    % that standard error to the average standard deviation  
    
    % sqrt of the number of days
    sqrt_n_day_i = sqrt(n_day_i);
    standard_error = stdev_i ./ sqrt_n_day_i;
    
    % if only 1 day of data, replace with the average standard deviation
    standard_error(n_day_i==1) = average_i;
    
    % write data
    month = char(A(i));
    month = month(1:3);
    filename = strcat(month, '_st_error_FCO2.xls');
    xlswrite(filename, standard_error)
    
end


