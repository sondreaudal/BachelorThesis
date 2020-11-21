%diff_mu = [-50:5:50];
%diff_mu = [0,0];
diff_mu = [-100:2:100];

%%%%%%%%%%%%%%%%%% NORWAY %%%%%%%%%%%%%%%%%%
            %%%%% INDVIDUAL %%%%%
plotH0(newData.Norway.read, newData.Norway.clsize, ...
    diff_mu,'Klassestr', newData.Norway.title)
plotH0(newData.Norway.read, newData.Norway.teacher_exp, ...
    diff_mu,'Lærererfaring',newData.Norway.title )

            %%%%% CLASS WISE %%%%%
plotH0(newData.Norway.statistics.clsize.pltmat(1,:), ....
       newData.Norway.statistics.clsize.pltmat(2,:), ...
        diff_mu,'Klassestr',[newData.Norway.title, ' class'])
plotH0(newData.Norway.statistics.TeachExp.pltmat(1,:), ....
       newData.Norway.statistics.TeachExp.pltmat(2,:), ...
        diff_mu,'Lærererfaring', [newData.Norway.title, ' class'] )
    
%%%%%%%%%%%%%%%%%% GERMANY %%%%%%%%%%%%%%%%%%
            %%%%% INDVIDUAL %%%%%
plotH0(newData.Germany.read, newData.Germany.clsize, ...
    diff_mu,'Klassestr', newData.Germany.title)
plotH0(newData.Germany.read, newData.Germany.teacher_exp, ...
    diff_mu,'Lærererfaring',newData.Germany.title )

            %%%%% CLASS WISE %%%%%
plotH0(newData.Germany.statistics.clsize.pltmat(1,:), ....
       newData.Germany.statistics.clsize.pltmat(2,:), ...
        diff_mu,'Klassestr',[newData.Germany.title, ' class'])
plotH0(newData.Germany.statistics.TeachExp.pltmat(1,:), ....
       newData.Germany.statistics.TeachExp.pltmat(2,:), ...
        diff_mu,'Lærererfaring', [newData.Germany.title, ' class'] )
    
%%%%%%%%%%%%%%%%%% USA %%%%%%%%%%%%%%%%%%
            %%%%% INDVIDUAL %%%%%
plotH0(newData.USA.read, newData.USA.clsize, ...
    diff_mu,'Klassestr', newData.USA.title)
plotH0(newData.USA.read, newData.USA.teacher_exp, ...
    diff_mu,'Lærererfaring',newData.USA.title )

            %%%%% CLASS WISE %%%%%
plotH0(newData.USA.statistics.clsize.pltmat(1,:), ....
       newData.USA.statistics.clsize.pltmat(2,:), ...
        diff_mu,'Klassestr',[newData.USA.title, ' class'])
plotH0(newData.USA.statistics.TeachExp.pltmat(1,:), ....
       newData.USA.statistics.TeachExp.pltmat(2,:), ...
        diff_mu,'Lærererfaring', [newData.USA.title, ' class'] )

%%%%%%%%%%%%%%%%%% THE WORLD %%%%%%%%%%%%%%%%%%
            %%%%% INDVIDUAL %%%%%
plotH0(myWorld.read, myWorld.clsize, ...
    diff_mu,'Klassestr', myWorld.title)
plotH0(myWorld.read, myWorld.teacher_exp, ...
    diff_mu,'Lærererfaring', myWorld.title )

            %%%%% CLASS WISE %%%%%
plotH0(myWorld.statistics.clsize.pltmat(1,:), ....
       myWorld.statistics.clsize.pltmat(2,:), ...
        diff_mu,'Klassestr',[myWorld.title, ' class'])
plotH0(myWorld.statistics.TeachExp.pltmat(1,:), ....
       myWorld.statistics.TeachExp.pltmat(2,:), ...
        diff_mu,'Lærererfaring', [myWorld.title, ' class'])

function [] = plotH0(var1, var2, diff_mu, xakse, country, tailtype)
if nargin <  6
    tailtype = 'both';
end

[nn, ~] = size(var1);
if nn ~= 1
    testmat = [var1';var2'];
else
    testmat = [var1;var2];
end %if, 
y0 = floor(length(diff_mu)/2);
Y0 = @(x) x-x+y0; 
[y, y_m] = colorFunc(testmat, diff_mu, tailtype);
[delta_m, accu_m] = valueTracker(y_m, y0);
[delta, accu] = valueTracker(y, y0);


figure('name', country); 
pcolor(y)
hold on;
plot(accu,'k','Linewidth',1.5)
plot(delta,'w','Linewidth',1.5)
fplot(Y0,'r','Linewidth',2)
colorbar
ylabel(['\Delta \mu, range: ', num2str(diff_mu(1)), ' - +' num2str(diff_mu(end))])
xlabel(xakse)
legend('Test restults', 'Accumulated change', 'Change pr year', '\Delta \mu = 0' )
title('Home made ttest')

figure('name', country); 
pcolor(y_m) 
hold on;
plot(accu_m,'k','Linewidth',1.5)
plot(delta_m,'w','Linewidth',1.5)
fplot(Y0,'r','Linewidth',2)
colorbar
ylabel(['\Delta \mu, range: ', num2str(diff_mu(1)), ' - +' num2str(diff_mu(end))])
xlabel(xakse)
legend('Test restults', 'Accumulated change', 'Change pr year', '\Delta \mu = 0' )
title('Matlab ttest')
end %plotH0

function [delta, accu] = valueTracker(mat_in, y0)
% Looking for 0s

[y_akse, x_akse] = size(mat_in);

delta = zeros(1,x_akse); Delta = zeros(1,x_akse+1);
accu = zeros(1, x_akse);
counter = 0;
pos = [];
for i = 1:x_akse
    for j = 1:y_akse
        if mat_in(j,i) == 0
            pos = [pos j];
            counter = counter +1;
        end %if
    end %j
    mid_position = median(pos);
    if counter == 0 || counter == y_akse; mid_position = y0; end
    delta(i) = mid_position; Delta(i) = mid_position-y0;
    accu(i) = sum(Delta); % summation
    counter = 0; pos = []; % resetting
end %i
accu = accu + y0;
end %function

function [mat, mat_m] = colorFunc(pltmatrix, diffMuVector,tailtype)
    rang = max(pltmatrix(2,:));    
    y = zeros(2,rang,length(diffMuVector));
    y_m = zeros(2,rang,length(diffMuVector));
    mat = zeros(length(diffMuVector),rang);
    mat_m = zeros(length(diffMuVector),rang);
    for i = 1:length(diffMuVector)
       [h0, h0_m] = matrixForTTest(pltmatrix, diffMuVector(i),tailtype);
        y (2,:,i) = h0;
        y_m (2,:,i) = h0_m;
        y(1,:,i) = [0 : max(pltmatrix(2,:))-1];
        y_m(1,:,i) = [0 : max(pltmatrix(2,:))-1];
    end % for i

    for u = 1:length(diffMuVector) 
        mat(u,:) = y(2,:,u);
        mat_m(u,:) = y_m(2,:,u);
    end
end% function

function [h0] = TwoVarTest(x1, x2, n1, n2, alfa, diffMu)

    s1 = std(x1); s2 = std(x2);
    avgX1 = mean(x1); avgX2 = mean(x2);

    Zc = ( (avgX1 - avgX2) - diffMu ) / ...
        sqrt(s1^2/n1 + s2^2/n2) ;


    Zv = norminv([alfa/2, 1-alfa/2]);
    %disp(Zv)

    if Zc < min(Zv) || Zc > max(Zv)
        h0 = true;
    else
        h0 = false;

    end %if

end%function

function [h0, h0_m] = matrixForTTest(pltmatrix, diffMu, tailtype)

[row, col] = size(pltmatrix);
offset = min(pltmatrix(2,:))-1;
rang = range(pltmatrix(2,:))+1;
newMatrix = cell(row+1,rang);
h0 = zeros(1,rang-1);
h0_m = zeros(1,rang-1);
emptyVec = 0;
for g = 1:rang
     newMatrix{3,g} = 0;
end %for g

for i = 1:col
    posisjon = pltmatrix(2,i)-offset;
    newMatrix{1,posisjon} = [newMatrix{1,posisjon} pltmatrix(1,i)];
    newMatrix{2,posisjon} = pltmatrix(2,i);
    newMatrix{3,posisjon} = newMatrix{3,posisjon}+1;
end %for 
counter = 0;
mem =0 ;
for j = 1:rang-1
    tester1 = j; tester2 = j+1;
    if mem == 1
        tester1 = j+1;
        tester2 = j+2; 
        if tester2 > rang        
            tester1 = j-1;
            tester2 = j+1; 
        end %tester2
        mem = 0;
    end %if mem
    
    if isempty( newMatrix{1,tester2})
        mem = 1;
        counter = counter +1;
        emptyVec(counter) = tester2;
        tester2 = tester2+1;
    end %if
    if ~isempty(newMatrix{1,tester1}) && ~isempty(newMatrix{1,tester2})
        h0(tester1) = TwoVarTest(newMatrix{1,tester1}, newMatrix{1,tester2}, ...
                            newMatrix{3,tester1}, newMatrix{3,tester2}, 0.05,diffMu);
        h0_m(tester1) = ttest2(newMatrix{1,tester1}, newMatrix{1,tester2}+diffMu, ...
                           'Vartype', 'unequal', 'Tail', tailtype);
    else
        h0(tester1) = -2;
        h0_m(tester1) = -2;
    end %empty check
    if isnan(h0_m(tester1)); h0_m(tester1) = -2;end

    
end %for rang

if sum(emptyVec) ~= 0
    for k = 1:length(emptyVec)
        h0(emptyVec(k)) = -1; 
        h0_m(emptyVec(k)) = h0_m(emptyVec(k)) -1;
    end % for empty
end %if empty
offset_vector = zeros(1,offset+1)-1;

temp_h0 = h0;
h0 = [offset_vector, temp_h0];

temp_h0_m = h0_m;
h0_m = [offset_vector, temp_h0_m];

end %function