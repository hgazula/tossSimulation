function d =  tossTrc2Mat(chosenTrial)

% d = zeros(180,51);

finalFileList = tossFileList();
file = char(finalFileList(str2num(chosenTrial), :));
fid = fopen(file);

if fid == -1
    disp('file open not successful');
else
    disp('file open successful')
    
    count = 0;
    i = 1;
    j = 1;
    
    while ~feof(fid)
        while count ~= 6
            fgetl(fid);
            count = count + 1;
        end
        
        remain = fgetl(fid);
        c=strfind(remain, char(9));
        k = 0;
        c = [c 0];
        
        for i=1:length(c)
            if c(i) == 0
                break;
            else
                
                m = (c(i)-1);
                if i-1 == 0 && (c(i+1)-c(i)==1) || (c(i+1)-c(i)==1) && (c(i) - c(i-1) == 1)
                    d(j, i)=0;
                else
                    d(j,i) = str2double(remain(k+1:m));
                end
                k = m+1;
            end
        end
        
        d(j, length(c)) = str2double(remain((c(8)+1):length(remain)));
        
        j = j + 1;
        
        for rows=1:size(d,1)
            for columns=3:size(d,2)
                if d(rows, columns)==0
                    d(rows, columns) = NaN;
                end
            end
        end
        
    end
    
    fcloseId = fclose(fid);
    
    if fcloseId == 0
        disp('file close successful');
    else
        disp ('file close not successful');
    end
end
end


