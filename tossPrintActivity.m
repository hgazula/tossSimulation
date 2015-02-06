function [distance, weight, percent, filename] = tossPrintActivity(currentdir, subNum)

distance = input('Please Enter distance (number only) 1m or 1.5m:');

while ~xor(distance ~= 1, distance ~= 1.5)
    fprintf('Incorrect Distance Choice!!!\n');
    distance = input('Please Enter distance (number only) 1m or 1.5m:');
end

flag = 0;
while ~flag    
    loadType = input('Please Enter Load Type:\n 1) Light\n 2) Medium\n 3) Heavy\n Press 1 or 2 or 3... ');
    
    while (loadType < 1 || loadType > 3)
        fprintf('Wrong Choice!!!\n');
        loadType = input('Please Enter Load Type:\n 1) Light\n 2) Medium\n 3) Heavy\n Press 1 or 2 or 3... ');
    end
            
    if loadType == 1
        weight = '1';
    elseif loadType == 2
        weight = '5';
    else
        weight = '7';
    end
    
    if isdir(fullfile(currentdir, subNum, 'tossing floor', [num2str(distance) ' m'], [weight ' kg']))
        flag = 1;
    else
        fprintf('Wrong Choice or Directory Doesn''t Exist\n');
    end
end

distance = num2str(distance);

percent = input('Please Choose Tolerance (110% or 150% or 200%)\n(Please enter number only)... ');

while xor(xor(percent ~= 110, percent ~= 150), percent ~= 200)
    fprintf('Incorrect Entry!!\n');
    percent = input('Please Choose Tolerance (110% or 150% or 200%)\n(Please enter number only)... ');
% else
%   percent = num2str(percent);  
end

percent = num2str(percent);
filename = fullfile(currentdir, subNum, 'tossing floor', [num2str(distance) ' m'], [weight ' kg'], [percent '%']);