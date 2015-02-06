function tossPlot(chosenTrialData, colors)

tossDataMat = chosenTrialData;

%Subplot Rows and Column number
plotRow=7;
plotColumn=6;
plotIndex = 1;

subPlotInfo = [plotRow plotColumn plotIndex];

[jointLocation plotIndex] = tossJointLocation(tossDataMat, subPlotInfo, colors);
subPlotInfo = [plotRow plotColumn plotIndex];

plotIndex = tossJointHorizontal(tossDataMat, jointLocation, subPlotInfo, colors);
subPlotInfo = [plotRow plotColumn plotIndex+1];

plotIndex = tossJointAngle('left', tossDataMat, jointLocation, subPlotInfo, colors);
subPlotInfo = [plotRow plotColumn plotIndex+1];

tossJointAngle('right', tossDataMat, jointLocation, subPlotInfo, colors);

end
