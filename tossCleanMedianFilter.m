% CLEANING PART -- NEW CODE TO FILL THE MISSING VALUES USING A MEDIAN
% FILTER

function tossRawDataMatClean = tossCleanMedianFilter(tossRawDataMat)
time = tossRawDataMat(:,2);
tossRawDataMatClean = zeros(size(tossRawDataMat));
tossRawDataMatClean(:,1:2) = tossRawDataMat(:,1:2);
a1 = medfilt1(tossRawDataMat,7);

for i = 3 : 47
% for i = 3 : size(tossRawDataMat,2)
    currVec = a1(:,i);
    abc = isnan(currVec);
    if sum(abc) >= (length(currVec)/2)
        tossRawDataMatClean = [];
        break;
    end
    goodData = find(~abc);
    interpVec = interp1(time(goodData),currVec(goodData),time,'linear','extrap');
    tossRawDataMatClean(:,i) = tossSmooth(interpVec);
end