% Bootstrap to calculate error of average FCO2 estimate for the Ross Sea
% for each month

% change as appropriate
cd('C:\')

FCO2_list = dir('*W14*');
FCO2_list = {FCO2_list.name};
st_err_list = dir('*st_error*');
st_err_list = {st_err_list.name};

output  =  [];
% add months to output
output(1,1) = 12;
output(2,1) = 2;
output(3,1) = 1;
output(4,1) = 3;
output(5,1) = 11;

% loop through each month
for j = 1:5
    % vector of all grid cell fco2 mean values for that month
    FCO2_j = xlsread(char(FCO2_list(j)));
    FCO2_j(isnan(FCO2_j)) = [];
    FCO2_j = FCO2_j';
    
    % vector of all grid cell fco2 standard errors for that month 
    st_err_j = xlsread(char(st_err_list(j)));
    st_err_j(isnan(st_err_j)) = [];
    st_err_j = st_err_j'
    
    % number of samples
    len = length(FCO2_j);
    
    % calculate average FCO2 for entire region 10000 times
    mean_FCO2_simulated = zeros(10000,1);
    
    for i = 1:10000
            % random indices
            r = randi([1 len],len,1);
            
            % len number of random numbers with a normal distribution (0,1)
            n = normrnd(0,1,[len 1]);
            
            % select random FCO2s (with replacement)
            FCO2_random = FCO2_j(r);
            
            % select random standard errors
            st_err_random = st_err_j(r);
            
            % random perturnations based on random standard errors
            perturbation = n .* st_err_random;
            
            % perturn the random FCO2s
            FCO2_perturbed = FCO2_random + perturbation;
            
            % calculate the mean FCO2
            mean_FCO2_simulated(i,1) = mean(FCO2_perturbed);
            
            % repeat 10,000 times
    end
    
    % output bootstrap errors for each month
    output(j,2) = mean(FCO2_j);
    output(j,3) = mean(mean_FCO2_simulated);
    output(j,4) = std(mean_FCO2_simulated);
    
end

% write file
filename = '1.monthly_error_FCO2.xlsx';
xlswrite(filename, output)
