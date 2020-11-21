for i = 25*25:1:25*25*25
    nam = nameFinder(i)
end



function name = nameFinder(number)
constant_A = 65; c = constant_A;
la = 25;

if number < la
    name = [char(c+number)];
elseif number <= la*la
    pos2 = floor(number/la);
    number = number - pos2*la;
    name = [char(c+pos2) char(c+number)]; 
    
elseif number < la*la*la
    pos3 = floor(number/(la*la));
    number = number-pos3*la*la;
    pos2 = floor(number/la);
    number = number - pos2*la;
    name = [char(c+pos3) char(c+pos2) char(c+number)];
elseif number < la*la*la*la
    pos4 = floor(number/(la*la*la));
    number = pos4*la*la*la;
    pos3 = floor(number/(la*la));
    number = number-pos3*la*la;
    pos2 = floor(number/la);
    number = number - pos2*la;
    name = [char(c+pos4) char(c+pos3) char(c+pos2) char(c+number)];
end
end


function [structure] = statsClasses(structure) 
classStructure = structure.class;
valuedVector = zeros(3,length(fieldnames(classStructure))); %lager en matrise
names = fieldnames(classStructure);

for i = 1:length(fieldnames(classStructure))
    name = names{i};
    tempValue = classStructure.(name);
    valuedVector(1,i) = mean(tempValue.clsize);             
    valuedVector(2,i) =  mean(tempValue.teacher_exp);
    valuedVector(3,i) = tempValue.meanScore;
end %for

meanValue_clsize = mean(valuedVector(1,:));
stdValue_clsize = std(valuedVector(1,:));

meanValue_teachExp = mean(valuedVector(2,:));
stdValue_teachExp = std(valuedVector(2,:));

structure.statistics.clsize.mean =  meanValue_clsize;
structure.statistics.clsize.std = stdValue_clsize;
structure.statistics.clsize.classScores = valuedVector(3,:);
structure.statistics.clsize.classSizes =  valuedVector(1,:);
structure.statistics.clsize.pltmat = [valuedVector(3,:) ; ...
                                    valuedVector(1,:)]; % scores;size

structure.statistics.TeachExp.mean = meanValue_teachExp;
structure.statistics.TeachExp.std = stdValue_teachExp;
structure.statistics.TeachExp.teachExpScores = valuedVector(3,:);
structure.statistics.TeachExp.experienses = valuedVector(2,:);
structure.statistics.TeachExp.pltmat = [valuedVector(3,:) ; ...
                                    valuedVector(2,:)]; % scores;exp


clsize_teach = cov(valuedVector(1,:),valuedVector(2,:));
teach_meanread =cov(valuedVector(2,:), valuedVector(3 ,:));
clsize_meanread = cov(valuedVector(1,:),valuedVector(3 ,:));

structure.statistics.kovarians.clsize_teach  = clsize_teach (2,1);
structure.statistics.kovarians.teach_meanread = teach_meanread(2,1);
structure.statistics.kovarians.clsize_meanread = clsize_meanread(2,1);

structure.statistics.clsize.cov = clsize_teach (1,1);
structure.statistics.TeachExp.cov = clsize_teach (2,2);

end % function
