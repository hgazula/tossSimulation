function [subNum, chosenTrial, weight, distance, percent, filename] = tossInitialization()

%% ignore all warnings
warning off all;

%% choose folder
fprintf('Please choose the directory where you have your tossing files....\n');
folder_name = uigetdir();

%% change current folder to that folder and adding to matlab path
currentdir = cd(folder_name);
currentdir = cd(folder_name);
addpath(currentdir);

% subNum = 0;
%% unzipping all files in the tossing folder
subNum = input('\nPlease Choose a Subject from 1 to 10:');
while (subNum < 1 || subNum > 10)
    fprintf('Incorrect Subject Number!!\n');
    subNum=input('\nPlease Choose a Subject from 1 to 10:');
end

subNum = num2str(subNum);

fprintf('Please Wait...Unzipping File...\n');
filename = [subNum '.zip'];
unzip(filename, fullfile(cd, subNum));
fprintf('Finished Unzipping\n');

%% Seeking user's input regarding task and trial number
fprintf('\nPlease Choose one among the following tasks\n 1)Lifting\n 2)Tossing onto Floor\n 3)Tossing onto Conveyor\n');
activity = 0;
activity = input('\nPress 1, 2 or 3... ');

while (activity < 1 || activity > 3)
    fprintf('Incorrect Choice\n');
    activity = input('\nPress 1, 2 or 3... ');
end

activity = num2str(activity);

if activity == '1'
    flag = 0;
    
    while ~flag
        loadType = input('Please choose Load Type\n 1) Light\n 2) Medium\n 3) Heavy\nPress 1 or 2 or 3... ' );
        if loadType == 1
            weight = '1';
        elseif loadType == 2
            weight = '5';
        else
            weight = '7';
        end
        filename = fullfile(currentdir, subNum, 'lifting', [weight ' kg']);
        
        if isdir(filename)
            flag = 1;
        else
            fprintf('Either Wrong Choice or Directory Doesn''t exist\n');
        end
        
    end
    distance = 0;
    percent = 0;
end

if activity == '2'
    [distance, weight, percent, filename] = tossPrintActivity(currentdir, subNum);
    %     filename = fullfile(currentdir, subNum, 'tossing floor', [distance ' m'], [weight ' kg'], [percent '%']);
end

if activity == '3'
    %     [distance, weight, percent]= tossPrintActivity();
   [distance, weight, percent, filename] = tossPrintActivity(currentdir, subNum);
    %     filename = fullfile(currentdir, subNum, 'tossing table', [distance ' m'], [weight ' kg'], [percent '%']);
end

% fprintf('Do you want plots for all trials or single trial\n 1)All Trials\n 2)Single Trial\n');
fprintf('Please enter the trial number...\n');
% plotType = 0;
% plotType = input('Press 1 or 2....');

% while (plotType < 1 || plotType > 2)
%     fprintf('Incorrect Choice\n');
%     plotType = input('Press 1 or 2...');
% end
% 
% if plotType == 2
    chosenTrial = input('please choose trial number between 1 to 14: ', 's');
%     addpath(cd(filename));
% else
%     chosenTrial = 0;
    addpath(cd(filename));
end
