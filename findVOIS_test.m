function [posisjonOfVOIS] = findVOIS_test(variblesOfInterestString, allVaribles)
posisjonOfVOIS = [];
for i = 1:length(variblesOfInterestString)
    disp(variblesOfInterestString{i})
    for j = 1:length(allVaribles)
        if strcmp(variblesOfInterestString{i}, ...
                   allVaribles{j})
           posisjonOfVOIS = [posisjonOfVOIS,j];
        end %if     
    end %for j
end %for i

end %function