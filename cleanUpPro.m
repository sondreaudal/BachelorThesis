data = struct;
HR = struct;
data.Argentina = csv2struct('Argentina.csv');

[bestVec, NewNum, HR.Argentina.income] = cleanUpProg(data.Argentina.income)

function [bestVec, NewNum, HR] = cleanUpProg(oldVec)

orgNum = length(oldVec);
NewNum = orgNum;
n = 1;
j = 1;

for i = 1:orgNum
    
    if isempty(oldVec(i))
        NewNum = NewNum -1;
    else 
        newVec(n) = oldVec(i);
        n = n+1;
    end %if
    
end %for

if iscell (newVec)
    newVec = cell2mat(newVec);
end %if

for k = 1:length(newVec)
    if isnan(newVec(k))
        NewNum = NewNum -1;
    else
        bestVec(j) = newVec(k);
        j = j+1;
    end %if

end %for

HR = NewNum/orgNum;
if HR == 0
    bestVec= [];
end%if

end %function


