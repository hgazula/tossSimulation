% This Function creates a list of *.trc files in the directory and sorts
% them in ascending order of the trial number

function finalFileList = tossFileList()

delete([cd '\*a.trc']);

initFileList = dir([cd '\*.trc']);

finalFileList = tossListSort(initFileList);

end