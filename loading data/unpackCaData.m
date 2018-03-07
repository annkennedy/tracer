function [rast,time] = unpackCaData(pth)

[~,fname,ext] = fileparts(pth);
disp(['Loading Ca file ' fname '...']);

% add cases to this switch statement for other data types~?
switch ext
    case '.csv'
        temp = csvread(pth);
        time = temp(:,1)';
        rast = temp(:,2)';
        % get rid of artifacts
        rast((1:500))    = nan;
        rast(end-119:end) = nan;
        
    case {'.xls','.xlsx'}
        % Prabhat's fiberphotometry data
    case '.mat'
        temp = load(pth);
        f    = fieldnames(temp);
        if(length(f)==1)
            if(isstruct(temp.(f{1})) && hasfield(temp.(f{1}),'C_raw')) %CNMFE data
                rast = temp.(f{1}).C_raw;
            else
                rast = temp.(f{1}); %assume it's a matrix of traces
            end
        elseif(isfield(temp,'neuron'))    %also CNMFE data data
            rast = temp.neuron.C_raw;
        else
            disp(['unsure which variable to read in ' fname]);
        end
        time = [];
    case '.flr'
        % Yatang Ca traces
        datapara = input_lyt(pth);
        rast = datapara.data';
        time=[];
end

disp('done');