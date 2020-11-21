%run Plotorama.m
figure('name', 'Norway - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
Nor.class.functions.i.function = @(x) Nor.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
scatter(1:max(newData.Norway.teacher_exp), Nor.plt.teach_exp(:,1),'filled','r'); 
fplot(Nor.class.functions.i.function , 'b','MarkerSize',12)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp')
ylim ([350 700])
xlim([0 inf])
legend('Norway','Polynom', 'Location', 'best')


figure('name', 'Norway - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.Norway.clsize), Nor.plt.clsize(:,1),'filled','r');
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size')
ylim ([350 700])
xlim([0 inf])
legend('Norway', 'Location', 'best')

%%%%%%%%%%%%%%%%%%%   Germany  %%%%%%%%%%%%%%%%%%%%%

Ger.class.functions.i.function = @(x) Ger.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
%Ger.class.functions.i.function = @(x) Ger.class.functions.i.betas * [x^4;x^3;x^2;x;1]; % 4.grad
figure('name', 'Germany - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
scatter(1:max(newData.Germany.teacher_exp), Ger.plt.teach_exp(:,1),'filled','b'); 
fplot(Ger.class.functions.i.function , 'r','MarkerSize',12)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp')
ylim ([350 700])
xlim([0 inf])
legend('Germany', 'Polynom','Location', 'best')


figure('name', 'Germany - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.Germany.clsize), Ger.plt.clsize(:,1),'filled','b'); 
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size')
ylim ([350 700])
xlim([0 inf])
legend('Germany', 'Location', 'best')



%%%%%%%%%%%%%%%%%%%%%   USA   %%%%%%%%%%%%%%%%%%%%%%%%%5


figure('name', 'USA - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
USA.class.functions.i.function = @(x) USA.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
%USA.class.functions.i.function = @(x) USA.class.functions.i.betas * [x^4;x^3;x^2;x;1]; % 4.grad
scatter(1:max(newData.USA.teacher_exp), USA.plt.teach_exp(:,1), 'filled', 'g'); 
fplot(USA.class.functions.i.function , 'r','MarkerSize',12)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp')
ylim ([350 700])
xlim([0 inf])
legend('USA', 'Polynom', 'Location', 'best')


figure('name', 'USA - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(newData.USA.clsize), USA.plt.clsize(:,1),'filled','g'); 
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size')
ylim ([350 700])
xlim([0 inf])
legend('USA',  'Location', 'best')


%%%%%%%%%%%%%%%%%%%%%%%%% THE WORLD %%%%%%%%%%%%%%%%%%%%%%%%


myWorld.class.functions.i.function = @(x) myWorld.class.functions.i.betas * [x^3;x^2;x;1]; %kubisk
figure('name', 'The World - Teacher Experience and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor;
scatter(1:max(myWorld.teacher_exp), myWorld.plt.teach_exp(:,1),'filled', 'm'); 
fplot(myWorld.class.functions.i.function , 'k','MarkerSize',15)
ylabel('Mean score for given experience')
xlabel('Teacher Exp')
title('Score to Techaer exp')
ylim ([350 700])
xlim([0 inf])
legend('The World', 'Polynom', 'Location', 'best')

figure('name', 'The World - Class size and test score');
% Area correspons to number of students having a teacher with that experience
% Outer circle is the showing the std of the SCORE, not size
grid on; hold on; grid minor; 
scatter(1:max(myWorld.clsize), myWorld.plt.clsize(:,1),'filled','m'); 
ylabel('Mean score for given class size')
xlabel('Class Size')
title('Score to class size')
ylim ([350 700])
xlim([0 inf])
legend('The World', 'Location', 'best')

