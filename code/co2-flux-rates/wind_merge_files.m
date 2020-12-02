% merges all the daily wind files for each cruise

% change as appropriate
cd('C:\')
dir_content = dir('C:\*1.jg*');
A = {dir_content.name};

init = char(A(1));
output = xlsread(init);

for i = 2:length(A)
    init2 = char(A(i));
    input = xlsread(init2);
    output = vertcat(output,input);
end

filename = 'NBP1102wind.xlsx';
xlswrite(filename,output)
   
