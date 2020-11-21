[Nor.plt.teach_exp] =  sizedAverage(newData.Norway.read, newData.Norway.teacher_exp);
[Ger.plt.teach_exp] =  sizedAverage(newData.Germany.read, newData.Germany.teacher_exp);
[USA.plt.teach_exp] =  sizedAverage(newData.USA.read, newData.USA.teacher_exp);
[myWorld.plt.teach_exp] = sizedAverage(myWorld.read, myWorld.teacher_exp);

[Nor.plt.clsize] =  sizedAverage(newData.Norway.read, newData.Norway.clsize);
[Ger.plt.clsize] =  sizedAverage(newData.Germany.read, newData.Germany.clsize);
[USA.plt.clsize] =  sizedAverage(newData.USA.read, newData.USA.clsize);
[myWorld.plt.clsize] = sizedAverage(myWorld.read, myWorld.clsize);

Nm = @(x) x-x+mean(newData.Norway.read);
Nl = @(x) x-x+mean(newData.Norway.read)-std(newData.Norway.read);
Nu = @(x) x-x+mean(newData.Norway.read)+std(newData.Norway.read);
Sm = @(x) x-x+mean(newData.Germany.read);
Sl = @(x) x-x+mean(newData.Germany.read)-std(newData.Germany.read);
Su = @(x) x-x+mean(newData.Germany.read)+std(newData.Germany.read);
Um = @(x) x-x+mean(newData.USA.read);
Ul = @(x) x-x+mean(newData.USA.read)-std(newData.USA.read);
Uu = @(x) x-x+mean(newData.USA.read)+std(newData.USA.read);
Wm = @(x) x-x+mean(myWorld.read);
Wl = @(x) x-x+mean(myWorld.read)-std(myWorld.read);
Wu = @(x) x-x+mean(myWorld.read)+std(myWorld.read);

sizeFactor = 3;
classSizeFactor = 8; csf = classSizeFactor;

figure('name', 'Norway - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
Nor.class.functions.i.function = @(x) Nor.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
scatter(1:max(newData.Norway.teacher_exp), Nor.plt.teach_exp(:,1), ...
    (Nor.plt.teach_exp(:,2)+1)*sizeFactor, 'filled','r'); 
plot(1:max(newData.Norway.teacher_exp),Nor.plt.teach_exp(:,1)-Nor.plt.teach_exp(:,3),'y*', ...
    'MarkerSize',7); 
plot(1:max(newData.Norway.teacher_exp),Nor.plt.teach_exp(:,1)+Nor.plt.teach_exp(:,3),'k*', ...
    'MarkerSize',7)
fplot(Nor.class.functions.i.function , 'b','MarkerSize',12)
fplot(Nm,'r');fplot(Nl,'r--');fplot(Nu,'r--')
alpha(.5)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('Norway', '- Std Norway','+ Std Norway', 'Polynom','Mean Norway', ...
    [char(177), 'std Norway'], 'Location', 'best')


figure('name', 'Norway - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.Norway.clsize), Nor.plt.clsize(:,1), ...
    (Nor.plt.clsize(:,2)+1)*csf, 'filled','r'); 
plot(1:max(newData.Norway.clsize),Nor.plt.clsize(:,1)-Nor.plt.clsize(:,3),'y*', ...
    'MarkerSize',10); 
plot(1:max(newData.Norway.clsize),Nor.plt.clsize(:,1)+Nor.plt.clsize(:,3),'k*', ...
    'MarkerSize',10)
fplot(Nm,'r');fplot(Nl,'r--');fplot(Nu,'r--')
alpha(.5)
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('Norway', '- Std Norway','+ Std Norway', 'Polynom','Mean Norway', ...
    [char(177), 'std Norway'], 'Location', 'best')

%%%%%%%%%%%%%%%%%%%   Germany  %%%%%%%%%%%%%%%%%%%%%

Ger.class.functions.i.function = @(x) Ger.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
%Ger.class.functions.i.function = @(x) Ger.class.functions.i.betas * [x^4;x^3;x^2;x;1]; % 4.grad
figure('name', 'Germany - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
scatter(1:max(newData.Germany.teacher_exp), Ger.plt.teach_exp(:,1), ...
    (Ger.plt.teach_exp(:,2)+1)*sizeFactor, 'filled','b'); 
plot(1:max(newData.Germany.teacher_exp),Ger.plt.teach_exp(:,1)-Ger.plt.teach_exp(:,3),'y*', ...
    'MarkerSize',7); 
plot(1:max(newData.Germany.teacher_exp),Ger.plt.teach_exp(:,1)+Ger.plt.teach_exp(:,3),'k*', ...
    'MarkerSize',7)
fplot(Ger.class.functions.i.function , 'r','MarkerSize',12)
fplot(Sm,'b');fplot(Sl,'b--');fplot(Su,'b--')
alpha(.5)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('Germany', '- Std Germany','+ Std Germany', 'Polynom','Mean Germany', ...
    [char(177), 'std Germany'], 'Location', 'best')


figure('name', 'Germany - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.Germany.clsize), Ger.plt.clsize(:,1), ...
    (Ger.plt.clsize(:,2)+1)*csf, 'filled','b'); 
plot(1:max(newData.Germany.clsize),Ger.plt.clsize(:,1)-Ger.plt.clsize(:,3),'y*', ...
    'MarkerSize',10); 
plot(1:max(newData.Germany.clsize),Ger.plt.clsize(:,1)+Ger.plt.clsize(:,3),'k*', ...
    'MarkerSize',10)
fplot(Sm,'b');fplot(Sl,'b--');fplot(Su,'b--')
alpha(.5)
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('Germany', '- Std Germany','+ Std Germany', 'Mean Germany', ...
    [char(177), 'std Germany'], 'Location', 'best')



%%%%%%%%%%%%%%%%%%%%%   USA   %%%%%%%%%%%%%%%%%%%%%%%%%5


figure('name', 'USA - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
USA.class.functions.i.function = @(x) USA.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
%USA.class.functions.i.function = @(x) USA.class.functions.i.betas * [x^4;x^3;x^2;x;1]; % 4.grad
scatter(1:max(newData.USA.teacher_exp), USA.plt.teach_exp(:,1), ...
    (USA.plt.teach_exp(:,2)+1)*sizeFactor, 'filled','g'); 
plot(1:max(newData.USA.teacher_exp),USA.plt.teach_exp(:,1)-USA.plt.teach_exp(:,3),'y*', ...
    'MarkerSize',7); 
plot(1:max(newData.USA.teacher_exp),USA.plt.teach_exp(:,1)+USA.plt.teach_exp(:,3),'k*', ...
    'MarkerSize',7)
fplot(USA.class.functions.i.function , 'r','MarkerSize',12)
alpha(.5)
fplot(Um,'g');fplot(Ul,'g--');fplot(Uu,'g--')
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('USA', '- Std USA','+ Std USA', 'Polynom','Mean USA', ...
    [char(177), 'std USA'], 'Location', 'best')


figure('name', 'USA - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.USA.clsize), USA.plt.clsize(:,1), ...
    (USA.plt.clsize(:,2)+1)*csf, 'filled','g'); 
plot(1:max(newData.USA.clsize),USA.plt.clsize(:,1)-USA.plt.clsize(:,3),'y*', ...
    'MarkerSize',10); 
plot(1:max(newData.USA.clsize),USA.plt.clsize(:,1)+USA.plt.clsize(:,3),'k*', ...
    'MarkerSize',10)
alpha(.5)
fplot(Um,'g');fplot(Ul,'g--');fplot(Uu,'g--')
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('USA', '- Std USA','+ Std USA', 'Mean USA', ...
    [char(177), 'std USA'], 'Location', 'best')


%%%%%%%%%%%%%%%%%%%%%%%%% THE WORLD %%%%%%%%%%%%%%%%%%%%%%%%


myWorld.class.functions.i.function = @(x) myWorld.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
figure('name', 'The World - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
scatter(1:max(myWorld.teacher_exp), myWorld.plt.teach_exp(:,1), ...
    (myWorld.plt.teach_exp(:,2)+1)*sizeFactor, 'filled','m'); 
plot(1:max(myWorld.teacher_exp),myWorld.plt.teach_exp(:,1)-myWorld.plt.teach_exp(:,3),'y*', ...
    'MarkerSize',7); 
plot(1:max(myWorld.teacher_exp),myWorld.plt.teach_exp(:,1)+myWorld.plt.teach_exp(:,3),'k*', ...
    'MarkerSize',7)
fplot(myWorld.class.functions.i.function , 'k','MarkerSize',15)
fplot(Wm,'b');fplot(Wl,'b--');fplot(Wu,'b--')
alpha(.5)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('The World', '- Std World','+ Std World', 'Polynom','Mean World', ...
    [char(177), 'std World'], 'Location', 'best')

figure('name', 'The World - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(myWorld.clsize), myWorld.plt.clsize(:,1), ...
    (myWorld.plt.clsize(:,2)+1)*(csf-1), 'filled','m'); 
plot(1:max(myWorld.clsize),myWorld.plt.clsize(:,1)-myWorld.plt.clsize(:,3),'y*', ...
    'MarkerSize',10); 
plot(1:max(myWorld.clsize),myWorld.plt.clsize(:,1)+myWorld.plt.clsize(:,3),'k*', ...
    'MarkerSize',10)
alpha(.4)
fplot(Wm,'b');fplot(Wl,'b--');fplot(Wu,'b--')
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size., area = # of students')
ylim ([350 700])
xlim([0 inf])
legend('The World', '- Std World','+ Std World','Mean World', ...
    [char(177), 'std World'], 'Location', 'best')



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