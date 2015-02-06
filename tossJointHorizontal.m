function  plotIndex = tossJointHorizontal(tossDataMat, jointLocation, subPlotInfo, colors)

%TOSSJOINTHORIZONTAL - This function is used to find the joint angle with
%respect to horizontal

MarkerIndex = {'L.Elbow w/ Hor', 'L.Shoulder w/ Hor ', 'L.hip w/ Hor', 'L.Knee w/ Hor', 'L.Ankle w/ Hor', 'Misc',...
    'R.Elbow w/ Hor', 'R.Shoulder w/ Hor', 'R.Hip w/ Hor', 'R.Knee w/ Hor', 'R.Ankle w/ Hor'};

plotRow = subPlotInfo(1);
plotColumn = subPlotInfo(2);
plotIndex = subPlotInfo(3);

angHor = cell(5,1);
horAngleIndex = 1;
% direction = [1 1 -1 -1 -1 -1 0 1 1 -1 -1 -1 -1];

for count = 1 : 5
    %     jointVec = (jointLocation{count}-jointLocation{count+1})*direction(count);
    jointVec = (jointLocation{count}-jointLocation{count+1});
    
    angHor{horAngleIndex} = atan2(jointVec(:,3), jointVec(:,1))*(180/pi);
    subplot(plotRow, plotColumn, plotIndex);
    %         axis([min(tossDataMat(:,2)) max(tossDataMat(:,2)) min((angHor{horAngleIndex})) max((angHor{horAngleIndex}))]);
    plot(tossDataMat(:,2), angHor{horAngleIndex}, colors{1});
    title(MarkerIndex{horAngleIndex});
    
    horAngleIndex = horAngleIndex + 1;
    plotIndex = plotIndex + 1; 
end

plotIndex = plotIndex + 1;

for count = 8 : 12
    %     jointVec = (jointLocation{count}-jointLocation{count+1})*direction(count);
    jointVec = (jointLocation{count}-jointLocation{count+1});
    angHor{horAngleIndex} = atan2(jointVec(:,3), jointVec(:,1))*(180/pi);
    
    subplot(plotRow, plotColumn, plotIndex);
    %     axis([min(tossDataMat(:,2)) max(tossDataMat(:,2)) min((angHor{horAngleIndex})) max((angHor{horAngleIndex}))]);
    plot(tossDataMat(:,2), angHor{horAngleIndex}, colors{1});
    title(MarkerIndex{horAngleIndex+1});
    
    horAngleIndex = horAngleIndex + 1;
    plotIndex = plotIndex + 1;
end

end
