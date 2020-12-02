% merges all the cruise track files (including instantaneous air sea
% fluxes)

% change as appropriate
cd('C:\')
dir_content = dir('C:\*2.F*');
A = {dir_content.name};

% not include data from 2003 
init = char(A(2));
output=xlsread(init);

for i=3:21
    init2 = char(A(i));
    input = xlsread(init2);
    output = vertcat(output,input);
end

filename = 'MASTER_flux_WM.xlsx';
xlswrite(filename,output)
