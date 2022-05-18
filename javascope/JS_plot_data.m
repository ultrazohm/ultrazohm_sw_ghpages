%% clean Matlab Workspace
close all
clear all
format compact

%% settings
delete_empty_log_files = 0;
save_all_logged_data = 0; 
plot_all_channels = 0;
rename_channels_manually = 0;
import_data_to_simulink_datainspector = 1;
overwrite_data_in_simulink_datainspector = 1;

%% import latest csv
Logfile_list = dir('Log_*.csv');
%chose latest logfile which is not empty
Logfile_list_size = Logfile_list.bytes;
for logfile_list_index = size(Logfile_list,1):-1:1
    if (Logfile_list(logfile_list_index).bytes>360)
        break;
    elseif(delete_empty_log_files == 1)
        % delete the most recent empty logfiles
        delete_file = [Logfile_list(logfile_list_index).folder,'\',Logfile_list(logfile_list_index).name];
        delete(delete_file)
        disp(['Deleted empty file: ', Logfile_list(logfile_list_index).name])
    end
end
file_name = Logfile_list(logfile_list_index).name

% paste file name here if you want to open a specific file
% file_name = 'Log_2022-02-16_10-27-23.csv';

% specify import options and read csv 
opts = detectImportOptions(file_name);
opts.VariableNamesLine = 4;
opts.VariableDescriptionsLine = 5;
opts = setvartype(opts, 'double');

log = readtable(file_name, opts);

%% Clean up imported data
% delete rows with NaNs 
toDelete = not(isfinite(log.time));
log(toDelete,:) = [];

% remove empty coloumns (that consists only of NaN)
number_of_coloumns = size(log,2);
remove_coloumns=[];

for i=1:number_of_coloumns
    col = log{:,i};
    try %works for all coloumns with numbers
    if(all(isnan(col)))
        remove_coloumns=[remove_coloumns i];
    end
    catch %works for all other coloumn types
        remove_coloumns=[remove_coloumns i];
    end
end
log(:,remove_coloumns)=[];

% read number of channels excluding time stamp generated by javascope
num_channels = size(log,2)-1;

% let time start from 0
n_samples_full = size(log.time,1);
log.time(:) = log.time - log.time(1);

% get names of entries in log table
channel_names  = log.Properties.VariableNames;
variable_names = log.Properties.VariableDescriptions;

%% Plot all channels
if(plot_all_channels ~= 0)
    for ch = 1:num_channels
        figure(ch)
    %     hold on
        plot_command = ['plot(log.',channel_names{ch+1},');']; 
        eval(plot_command)
        title(variable_names{ch+1}, 'Interpreter', 'none') %first entry is the time stamp
    end
end

%% Useful subplots with synchronized x-axis zoom
nplots = 4; %choose how many plots in one figure

if(plot_all_channels ~= 0)
    for plots = 1:ceil(num_channels/nplots)
        figure(100+plots)
        tiledlayout(nplots,1)

        for plot_ch=1:nplots
            ax(plot_ch) = nexttile;
            hold on
            ch = plot_ch + nplots*(plots-1);
            if(ch>num_channels)
                break
            end
            plot_command = ['plot(log.',channel_names{ch+1},');'];        
            eval(plot_command)
            title(variable_names{ch+1}, 'Interpreter', 'none') %first entry is the time stamp
        end
        %synochronize x-axis zoom
        linkaxes(ax,'x')
    end
end
%% rename channels - if needed - done manually by user!
if (rename_channels_manually ~= 0)
    log = renamevars(log, "CH1",  "CH1" );
    log = renamevars(log, "CH2",  "CH2" );
    log = renamevars(log, "CH3",  "CH3" );
    log = renamevars(log, "CH4",  "CH4" );
    log = renamevars(log, "CH5",  "CH5" );
    log = renamevars(log, "CH6",  "CH6" );
    log = renamevars(log, "CH7",  "CH7" );
    log = renamevars(log, "CH8",  "CH8" );
    log = renamevars(log, "CH9",  "CH9" );
    log = renamevars(log, "CH10", "CH10");
    log = renamevars(log, "CH11", "CH11");
    log = renamevars(log, "CH12", "CH12");
    log = renamevars(log, "CH13", "CH13");
    log = renamevars(log, "CH14", "CH14");
    log = renamevars(log, "CH15", "CH15");
    log = renamevars(log, "CH16", "CH16");
    log = renamevars(log, "CH17", "CH17");
    log = renamevars(log, "CH18", "CH18");
    log = renamevars(log, "CH19", "CH19");
    log = renamevars(log, "CH20", "CH20");
    channel_names  = log.Properties.VariableNames;
end

%% saving data in compressed mat file format
file_name_log = file_name(1:end-4);

if (save_all_logged_data ~= 0)
    save(file_name_log,'log','variable_names','channel_names','-v7.3')
end

%% Import Data into Simulink Data Inspector
if(import_data_to_simulink_datainspector ~= 0)
    
    % check if run has already been imported
    run_already_imported = 0;
    openRunIDs = Simulink.sdi.getAllRunIDs;
    for runs = 1:size(openRunIDs,1)
        currentRun = Simulink.sdi.getRun(openRunIDs(runs));
        if(strcmp(currentRun.Name,file_name_log))
            if (overwrite_data_in_simulink_datainspector == 1)
                run_already_imported = 0;
                Simulink.sdi.deleteRun(openRunIDs(runs))
                disp('Your run has already been imported and is overwritten.')
            else
                run_already_imported = 1;
                disp('Your run has already been imported and is not imported again.')
            end
        end
    end
    
    % import run to data inspector
    if run_already_imported == 0
        runID = Simulink.sdi.createRun(file_name_log);
        for ch = 1:num_channels
            createTimeSeries_ChN = ['Series = timeseries(log.',channel_names{ch+1},', log.time);'];
            eval(createTimeSeries_ChN);
            Series.Name = variable_names{ch+1};
            Simulink.sdi.addToRun(runID,'vars',Series);
        end
    end
    Simulink.sdi.view
    
end


