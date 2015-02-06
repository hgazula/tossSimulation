function  plotIndex = tossJointAngle (bodySide, tossDataMat, jointLocation, subPlotInfo, colors)

% TOSSJOINTANGLE - This function is used to find the included angle between
% the joints

if strcmp(bodySide, 'left')
    initial = 2;
    final = 6;
    jointAngleIndex = {'L.Elbow Angle', 'L.Shoulder Angle', 'L.Hip Angle', ...
                        'L.Knee Angle', 'L.Ankle Angle'};
    
else
    initial = 9;
    final = 13;
    jointAngleIndex = {'R.Elbow Angle', 'R.Shoulder Angle', 'R.Hip Angle', ...
                        'R.Knee Angle', 'R.Ankle Angle'};
end

plotRow = subPlotInfo(1);
plotColumn = subPlotInfo(2);
plotIndex = subPlotInfo(3);

jointAngle = cell(5, 1);
joint = 1;

for count = initial:final
    fwdLinkVec = (jointLocation{count-1} - jointLocation{count});
    bkwdLinkVec = (jointLocation{count+1} - jointLocation{count});
    
    jointAngleNum = dot(fwdLinkVec,bkwdLinkVec, 2);
    
    fwdLinkNorm = (sqrt(sum((fwdLinkVec').^2)))';
    bkwdLinkNorm = (sqrt(sum((bkwdLinkVec').^2)))';
    
    jointAngleDen = fwdLinkNorm.*bkwdLinkNorm;
    
    jointAngle{joint} = (acos(jointAngleNum./jointAngleDen)*(180/pi));
    
    subplot(plotRow, plotColumn, plotIndex);
%     axis([min(tossDataMat(:,2)) max(tossDataMat(:,2)) min((jointAngle{joint})) max((jointAngle{joint}))]);
    plot(tossDataMat(:,2), jointAngle{joint}, colors{1});
    title(jointAngleIndex{joint})
    
    joint = joint + 1;
    plotIndex = plotIndex + 1;
    
end

end