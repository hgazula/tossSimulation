function [jointLocation plotIndex] = tossJointLocation(tossDataMat, subPlotInfo, colors)

jointLocation = cell(12,1);

jointIndex = {'Left Wrist', 'Left Elbow', 'Left Shoulder', 'Left Hip', 'Left Knee', 'Left Ankle', 'Right Wrist', 'Right Elbow', 'Right Shoulder', 'Right Hip', 'Right Knee', 'Right Ankle'};

plotRow = subPlotInfo(1);
plotColumn = subPlotInfo(2);
plotIndex = subPlotInfo(3);

for jN = 1:12
    
    jointLocation{jN} = tossDataMat(:, 3*jN:(3*jN+2));
    
    subplot(plotRow, plotColumn, plotIndex);
    for k = 1:3
        %         axis([min(tossDataMat(:,2)) max(tossDataMat(:,2)) min(min((jointLocation{jN}))) max(max((jointLocation{jN})))]);
        plot(tossDataMat(:,2), (jointLocation{jN}(:,k)), colors{k});
        title(jointIndex{jN});
        hold on
    end
    plotIndex = plotIndex + 1;
    
end

leftFootMarker = [jointLocation{5}(:,1:2), jointLocation{6}(:,3)];
rightFootMarker = [jointLocation{11}(:,1:2), jointLocation{12}(:,3)];

jointLocation = {jointLocation{1:6}, leftFootMarker, jointLocation{7:12}, rightFootMarker}';

end

