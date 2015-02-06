close all;
clear all;
clc;
addpath(cd)

global colors;
colors = {'r', 'g', 'b'};

fprintf('Please welcome...\n');

response = 'c';

while strcmpi(response, 'c')
    [~, chosenTrial, ~, ~, ~, ~] = tossInitialization();
    try        
        chosenTrialData1 = tossTrc2Mat(chosenTrial);
        chosenTrialData = tossCleanMedianFilter(chosenTrialData1);
        tossSimulation(chosenTrialData);
    catch myEx
        fprintf('Bad Data..Please Continue\n');
        continue
    end    
    response = input('\nPress C/c to continue or Q/q to quit..', 's');    
end

fprintf('\nHope you Enjoyed your Simulation. Bye Bye...\n');