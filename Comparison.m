[Nor.mat.teach_exp] =  sizedAverage(newData.Norway.read, newData.Norway.teacher_exp);
[Ger.mat.teach_exp] =  sizedAverage(newData.Germany.read, newData.Germany.teacher_exp);
[USA.mat.teach_exp] =  sizedAverage(newData.USA.read, newData.USA.teacher_exp);

[Nor.mat.clsize] =  sizedAverage(newData.Norway.read, newData.Norway.clsize);
[Ger.mat.clsize] =  sizedAverage(newData.Germany.read, newData.Germany.clsize);
[USA.mat.clsize] =  sizedAverage(newData.USA.read, newData.USA.clsize);

sizeFactor = 3;

figure('name', 'Scatter plot, size and average - Tea.Exp');
grid on; hold on; grid minor; 
scatter(1:max(newData.Norway.teacher_exp), Nor.mat.teach_exp(:,1), ...
    (Nor.mat.teach_exp(:,2)+1)*sizeFactor, 'filled','r'); 
scatter(1:max(newData.Germany.teacher_exp), Ger.mat.teach_exp(:,1)', ...
    (Ger.mat.teach_exp(:,2)+1)*sizeFactor, 'filled','b');
scatter(1:max(newData.USA.teacher_exp), USA.mat.teach_exp(:,1), ...
    (USA.mat.teach_exp(:,2)+1)*sizeFactor, 'filled','g'); 
alpha(.5)
ylabel('Mean reading score for given experience')
xlabel('Teacher Exp')
title('Score to Teacher Experience')
ylim ([400 650])
legend('Norway', 'Germany', 'USA', ...
    'Std Norway' , 'Std Germany', 'Std USA')


figure('name', 'Scatter plot, size and average - Clsize');
grid on; hold on; grid minor; 
scatter(1:max(newData.Norway.clsize), Nor.mat.clsize(:,1), ...
    (Nor.mat.clsize(:,2)+1)*sizeFactor, 'filled','r'); 
scatter(1:max(newData.Germany.clsize), Ger.mat.clsize(:,1)', ...
    (Ger.mat.clsize(:,2)+1)*sizeFactor,'filled', 'b');  
scatter(1:max(newData.USA.clsize), USA.mat.clsize(:,1), ...
    (USA.mat.clsize(:,2)+1)*sizeFactor, 'filled','g'); 
alpha(.5)
% fplot(Nm,'r');fplot(Sm,'b');fplot(Um,'g')
% fplot(Nl,'r--');fplot(Sl,'b--');fplot(Ul,'g--')
% fplot(Nu,'r--');fplot(Su,'b--');fplot(Uu,'g--')
ylabel('Mean reading score for given class size')
xlabel('Class size')
title('Score to Class size')
ylim ([400 650])
legend('Norway', 'Germany', 'USA', ...
    'Std Norway' , 'Std Germany', 'Std USA')

figure('name', '3D scatter plot, all cleaned data');
hold on; grid on;
scatter3(newData.Norway.(vois{3}), newData.Norway.(vois{2}),...
            newData.Norway.(vois{1}), 'r*')
scatter3(newData.Germany.(vois{3}), newData.Germany.(vois{2}),...
            newData.Germany.(vois{1}), 'b')
scatter3(newData.USA.(vois{3}), newData.USA.(vois{2}),...
            newData.USA.(vois{1}), 'gs')
xlabel(vois{3}); ylabel(vois{2}); zlabel(vois{1})
title('All data satt opp mot hverandre')
xlim([0 inf])
legend(data.Norway.title,data.Germany.title,data.USA.title ,'Location', 'best')


Nm = @(x) x-x+mean(newData.Norway.read);
Nl = @(x) x-x+mean(newData.Norway.read)-std(newData.Norway.read);
Nu = @(x) x-x+mean(newData.Norway.read)+std(newData.Norway.read);
Sm = @(x) x-x+mean(newData.Germany.read);
Sl = @(x) x-x+mean(newData.Germany.read)-std(newData.Germany.read);
Su = @(x) x-x+mean(newData.Germany.read)+std(newData.Germany.read);
Um = @(x) x-x+mean(newData.USA.read);
Ul = @(x) x-x+mean(newData.USA.read)-std(newData.USA.read);
Uu = @(x) x-x+mean(newData.USA.read)+std(newData.USA.read);
Vm = @(x) x-x+mean(myWorld.read);
Vl = @(x) x-x+mean(myWorld.read)-std(myWorld.read);
Vu = @(x) x-x+mean(myWorld.read)+std(myWorld.read);

figure('name', 'Line comparison');
hold on; grid on;
fplot(Nm,'r');fplot(Sm,'b');fplot(Um,'g');fplot(Vm,'m')
fplot(Nl,'r--');fplot(Sl,'b--');fplot(Ul,'g--');fplot(Vl,'m--')
fplot(Nu,'r--');fplot(Su,'b--');fplot(Uu,'g--');fplot(Vu,'m--')
xlabel(''); ylabel('read')
xlim([0 inf])
title('Read scores visualized, Norway - Germany - USA - The World')
legend('Avg. Norway', 'Avg. Germany', 'Avg. USA','Avg. World',...
    [char(177), 'std Norway'], [char(177), 'std Germany'], ...
    [char(177), 'std USA'], [char(177), 'std World'], 'Location', 'best')

figure('name', 'Scatter comparison, Teacher Exp');
hold on; grid on;
scatter(newData.Norway.teacher_exp, newData.Norway.read,'r*')
scatter(newData.Germany.teacher_exp, newData.Germany.read,'b')
scatter(newData.USA.teacher_exp, newData.USA.read,'gs')
fplot(Nm,'r');fplot(Sm,'b');fplot(Um,'g')
xlabel('Teacher Exp'); ylabel('read')
xlim([0 inf])
title('Read vs Teacher Exp, Norway - Germany - USA')
legend(data.Norway.title, data.Germany.title, data.USA.title, ...
       'Avg. Norway', 'Avg. Germany', 'Avg. USA', 'Location', 'best')
   
figure('name', 'Scatter comparison, Class size');
hold on; grid on;
scatter(newData.Norway.clsize, newData.Norway.read,'r*')
scatter(newData.Germany.clsize, newData.Germany.read,'b')
scatter(newData.USA.clsize, newData.USA.read,'gs')
fplot(Nm,'r');fplot(Sm,'b');fplot(Um,'g')
xlabel('Class size'); ylabel('read')
title('Read vs Class size, Norway - Germany - USA')
xlim([0 inf])
legend(data.Norway.title, data.Germany.title, data.USA.title, ...
       'Avg. Norway', 'Avg. Germany', 'Avg. USA', 'Location', 'best')

   
   
function  [mat] =  sizedAverage(readscr, varible)

sz = length(readscr);
weightVector = zeros(1,max(varible));
scoreVector = zeros(sz,max(varible));
for i = 1:sz
    weightVector(varible(i)) = weightVector(varible(i))+1;
    scoreVector(i,varible(i)) = readscr(i);
end %for

[ii,~,v] = find(scoreVector');
meanScoreVector = accumarray(ii,v,[],@mean);
stdScoreVector = accumarray(ii,v,[],@std);
weightVector = weightVector';

mat(:,1)= meanScoreVector;
mat(:,2) = weightVector;
mat(:,3) = stdScoreVector;
end %function
   
   
   
   
   
   
   