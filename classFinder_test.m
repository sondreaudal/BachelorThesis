newData.USA = classFinder(newData.USA, vois);
res = plotClases(newData.USA);

function [structure] = classFinder(structure, vois)
internalCount = 1;
classNumber = 1;
name = char(64+classNumber);
structure.class = struct;
tempStruct = struct;

% First itteration
for j = 1:length(vois)
    tempStruct.(vois{j})(internalCount) = structure.(vois{j})(1);   
end %for j
     internalCount = internalCount + 1;

% Remaining itterations
for i = 2:length(structure.clsize)
    if structure.clsize(i) == structure.clsize(i-1) && ...
            structure.teacher_exp(i) == structure.teacher_exp(i-1)  ...
            && internalCount <= structure.clsize(i)
        for j = 1:length(vois)
            tempStruct.(vois{j})(internalCount) = structure.(vois{j})(i);   
        end %for j
        internalCount = internalCount + 1;
    else
        tempStruct.meanScore = mean(tempStruct.read);
        tempStruct.HR = length(tempStruct.read)/mean(tempStruct.clsize);
        structure.class.(name) = tempStruct;
        internalCount = 1;
        tempStruct = struct; % resetting
        classNumber = 1 + classNumber;
        name = nameFinder(classNumber);
        % First new itteration
        for j = 1:length(vois)
            tempStruct.(vois{j})(internalCount) = structure.(vois{j})(i);   
        end %for j
        internalCount = internalCount + 1;
    end %if
    
end %for i

% Last itteration
classNumber = classNumber + 1;
name = nameFinder(classNumber);
tempStruct.meanScore = mean(tempStruct.read);
tempStruct.HR = length(tempStruct.read)/mean(tempStruct.clsize);
structure.class.(name) = tempStruct;
end %function

function name = nameFinder(number)

constant_A = 65; c = constant_A;
letterAlpha = 26; la=letterAlpha;

extraPos1 = floor((number/la));
if extraPos1 >= 1
    newPos2 = number - extraPos1*la;
end %if extra

name = char(c+number);

if c+number > 65+25
    name = [char(64+extraPos1) char(c+newPos2)];
end %if name


end %function

function [valuedVector] = plotClases(structure) 
classStructure = structure.class;
ti = structure.title;   % ti: tittel

names = fieldnames(classStructure);
valuedVector = zeros(4,length(fieldnames(classStructure))); %lager en matrise
for i = 1:length(fieldnames(classStructure))
    name = names{i};
    tempValue = classStructure.(name);
    valuedVector(1,i) = mean(tempValue.clsize);             
    valuedVector(2,i) =  mean(tempValue.teacher_exp);
    valuedVector(3,i) = tempValue.meanScore;
end %for

% size fixing
sizeFactor = 250; sf = sizeFactor;
mu = mean(valuedVector(3,:));
for j = 1:length(valuedVector(3,:))
    valuedVector(4,j) = ( (valuedVector(3,j) - mu)/...
        length(valuedVector(3,:)) )*exp(0.04*(valuedVector(3,j) - mu))+1;
end % for j 

Dm = @(x) x-x+mean(structure.read);
Dl = @(x) x-x+mean(structure.read)-std(structure.read);
Du = @(x) x-x+mean(structure.read)+std(structure.read);


figure; 
hold on; grid on;
scatter(valuedVector(1,:), valuedVector(2,:), valuedVector(4,:).*sf, 'filled','g')
scatter(mean(valuedVector(1,:)),mean(valuedVector(2,:)), mean(valuedVector(4,:)).*sf, 'filled','r') %gjennomsnitt
xlabel('clsize')
ylabel('teacher_exp')
title(ti)
alpha(.35)

end % function


