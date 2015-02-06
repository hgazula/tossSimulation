function tossPlotAllTrials()

finalFileList = tossFileList();

for i = 1:size(finalFileList, 1)
    
    colors = {'r', 'g', 'b'};
    chosenTrialData1 = tossTrc2Mat(num2str(i));
    chosenTrialData = tossCleanMedianFilter(chosenTrialData1);
    figure('units','normalized','outerposition',[0 0 1 1]);
    tossPlot(chosenTrialData, colors);
    
%     if i == 1
%         print -dpsc 'out.ps';
%     else
%         print -dpsc -append 'out.ps';
%     end
%     
end