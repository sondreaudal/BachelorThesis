function [stract] = recursStat_test(field)
     stract.mean = mean(field);
     stract.stdavvik = std(field);
     stract.max = max(field);
     stract.min = min(field);
end
