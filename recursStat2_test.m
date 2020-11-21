
function [stract] = recursStat2_test(MainField, otherField)
    % otherField = n-1;
     stract.mean = mean(MainField);
     stract.stdavvik = std(MainField);
     stract.max = max(MainField);
     stract.min = min(MainField);
     stract.cov = cov(MainField, otherField);
end