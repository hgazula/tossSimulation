function fileList = tossListSort(initFileList)

% Afields = fieldnames(initFileList);
Acell = struct2cell(initFileList);
sz = size(Acell); 

% Convert to a matrix
Acell = reshape(Acell, sz(1), []);      % Px(MxN)

% Make each field a column
Acell = Acell';                         % (MxN)xP

% Sort by first field "name"
fileList = tossSort_nat(Acell(:,1));

end