function [SortedStruct] = stats_test(intrestFields,intrestFieldsString)
    SortedStruct = struct;
    n = length(intrestFields);
    m = length(intrestFieldsString);
    if m ~= n
        error ('Mismatch intrestFields and intrestFieldsString')
    end %if 
    
    while n>0
        if n > 1
            name = intrestFieldsString{n};
            [SortedStruct.(name)] = recursStat2_test(intrestFields{n}, intrestFields{n-1});   
        else
            name = intrestFieldsString{n};
            [SortedStruct.(name)] = recursStat_test(intrestFields{n});
        end %if
        n = n-1;
    end %while
end %function