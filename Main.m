addpath 'C:\Users\Sondre Audal\Documents\MATLAB\02 Bachelor\Bachelor\Datafile';
run DataGathering.m
run DataCleanUp.m
grade = 4; %comparing apples to apples
allVaribles = {'idcntry','idgrade','read','girl','birthm','birthy','age','not_born','par_not_born', 'early_ability', 'par_edu','income','kinderg_att',...
    'speak_testlang_home', 'books_home', 'par_emp', 'clsize', 'teacher_exp', 'teacher_age', 'teacher_fem', ...
    'teacher_cert', 'teacher_edu', 'pc_class', 'schoolsize4', 'school_location', 'pct_disadv', 'pct_abroad',...
    'sameteacher4_plus', 'sameteacher1_less'};

variblesOfInterestString = {'read', 'teacher_exp', 'clsize'};
vois = variblesOfInterestString; %just shorter

[posisjonOfVOIS] = findVOIS(vois, allVaribles);

res = struct;
Nor = struct; Nor.to = struct; Nor.tre = struct;
variblesOfInterest = {newData.Norway.(allVaribles{posisjonOfVOIS(1)}), newData.Norway.(allVaribles{posisjonOfVOIS(2)}), ...
                      newData.Norway.(allVaribles{posisjonOfVOIS(3)})};
voi = variblesOfInterest; %just shorter

if max(newData.Norway.idgrade) ~= min(newData.Norway.idgrade);warning('multiple grade');...
[Nor, Nor.HR, ~] = sortInfo ( newData.Norway.idgrade, voi, vois, grade);end %comparing apples to apples

newData.Norway = classFinder(newData.Norway, vois);
res.Norway = plotClases(newData.Norway.class, data.Norway.title,'r');

Nor.a = estimering(newData.Norway.read, newData.Norway.teacher_exp); 

Nor.b = estimering(newData.Norway.read, newData.Norway.teacher_exp, newData.Norway.clsize);

Nor.g = estimering(newData.Norway.read, newData.Norway.teacher_exp,...
                            newData.Norway.clsize, newData.Norway.teacher_exp...
                            .*newData.Norway.teacher_exp.*newData.Norway.teacher_exp);
Nor.h = estimering(newData.Norway.read, newData.Norway.teacher_exp,...
                            newData.Norway.clsize, newData.Norway.teacher_exp./...
                                                         newData.Norway.clsize);
Nor.i.betas = polyfit(newData.Norway.teacher_exp, newData.Norway.read,3); %cubic function                                                 
                              
Nor.functions.a = functionFinder(Nor.a.betas, newData.Norway.teacher_exp);
Nor.functions.b = functionFinder(Nor.b.betas, newData.Norway.teacher_exp,newData.Norway.clsize);

Nor.r2.a = calcR2(newData.Norway.teacher_exp, Nor.a.betas, newData.Norway.read);

Nor.r2.b = calcR2([newData.Norway.teacher_exp, newData.Norway.clsize],...
                Nor.b.betas, newData.Norway.read);
        
Nor.r2.h = calcR2([newData.Norway.teacher_exp, newData.Norway.clsize, ...
                    newData.Norway.teacher_exp./newData.Norway.clsize], ...
                    Nor.h.betas, newData.Norway.read);
                
Nor.r2.i = calcR2([newData.Norway.teacher_exp, newData.Norway.teacher_exp.^2, ...
                    newData.Norway.teacher_exp.^3], ...
                    Nor.i.betas, newData.Norway.read);
% r2: the closer to 1,  the better. The closer to 0, the worse

Nor.stats = stats(voi,vois);
%res = createPlots(Nor.functions.b, data.Norway.title)
createPlots(Nor.functions.b,[newData.Norway.read, newData.Norway.teacher_exp,...
            newData.Norway.clsize], data.Norway.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
USA = struct; USA.to = struct; USA.tre = struct;
variblesOfInterest = {newData.USA.(allVaribles{posisjonOfVOIS(1)}), newData.USA.(allVaribles{posisjonOfVOIS(2)}), ...
                      newData.USA.(allVaribles{posisjonOfVOIS(3)})};
voi = variblesOfInterest; %just shorter

newData.USA = classFinder(newData.USA, vois);
res.USA = plotClases(newData.USA.class, data.USA.title, 'g');

USA.a = estimering(newData.USA.read, newData.USA.teacher_exp); 

USA.b = estimering(newData.USA.read, newData.USA.teacher_exp, newData.USA.clsize);
                       
USA.g = estimering(newData.USA.read, newData.USA.teacher_exp,...
                            newData.USA.clsize, newData.USA.teacher_exp...
                            .*newData.USA.teacher_exp.*newData.USA.teacher_exp);
USA.h = estimering(newData.USA.read, newData.USA.teacher_exp,...
                            newData.USA.clsize, newData.USA.teacher_exp./...
                                                         newData.USA.clsize);
USA.i.betas = polyfit(newData.USA.teacher_exp, newData.USA.read,3); %cubic function 

                              
USA.functions.a = functionFinder(USA.a.betas, newData.USA.teacher_exp);
USA.functions.b = functionFinder(USA.b.betas, newData.USA.teacher_exp,newData.USA.clsize);


USA.r2.a = calcR2(newData.USA.teacher_exp, USA.a.betas, newData.USA.read);

USA.r2.b = calcR2([newData.USA.teacher_exp, newData.USA.clsize],...
                USA.b.betas, newData.USA.read);
            
USA.r2.h = calcR2([newData.USA.teacher_exp, newData.USA.clsize, ...
                    newData.USA.teacher_exp./newData.USA.clsize], ...
                    USA.h.betas, newData.USA.read);
                
USA.r2.i = calcR2([newData.USA.teacher_exp, newData.USA.teacher_exp.^2, ...
                    newData.USA.teacher_exp.^3], ...
                    USA.i.betas, newData.USA.read);
% r2: the closer to 1,  the better. The closer to 0, the worse

USA.stats = stats(voi,vois);


%res = createPlots(USA.functions.b, data.USA.title)
createPlots(USA.functions.b,[newData.USA.read, newData.USA.teacher_exp,...
            newData.USA.clsize], data.USA.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};
% Hypotesetester
% hvis h = 0, forkastes ikke null-hypotesen                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ger = struct; Ger.to = struct; Ger.tre = struct;
variblesOfInterest = {newData.Germany.(allVaribles{posisjonOfVOIS(1)}), newData.Germany.(allVaribles{posisjonOfVOIS(2)}), ...
                      newData.Germany.(allVaribles{posisjonOfVOIS(3)})};
voi = variblesOfInterest; %just shorter

if max(newData.Germany.idgrade) ~= min(newData.Germany.idgrade);warning('multiple grade');...
[Ger, Ger.HR, ~] = sortInfo ( newData.Germany.idgrade, voi, vois, grade);end %comparing apples to apples

newData.Germany = classFinder(newData.Germany, vois);
res.Germany = plotClases(newData.Germany.class, data.Germany.title,'b');

Ger.a = estimering(newData.Germany.read, newData.Germany.teacher_exp); 

Ger.b = estimering(newData.Germany.read, newData.Germany.teacher_exp, newData.Germany.clsize);
                       
Ger.g = estimering(newData.Germany.read, newData.Germany.teacher_exp,...
                            newData.Germany.clsize, newData.Germany.teacher_exp...
                            .*newData.Germany.teacher_exp.*newData.Germany.teacher_exp);
Ger.h = estimering(newData.Germany.read, newData.Germany.teacher_exp,...
                            newData.Germany.clsize, newData.Germany.teacher_exp./...
                                                         newData.Germany.clsize);
Ger.i.betas = polyfit(newData.Germany.teacher_exp, newData.Germany.read,3); %cubic function   

                              
Ger.functions.a = functionFinder(Ger.a.betas, newData.Germany.teacher_exp);
Ger.functions.b = functionFinder(Ger.b.betas, newData.Germany.teacher_exp,newData.Germany.clsize);

Ger.r2.a = calcR2(newData.Germany.teacher_exp, Ger.a.betas, newData.Germany.read);

Ger.r2.b = calcR2([newData.Germany.teacher_exp, newData.Germany.clsize],...
                Ger.b.betas, newData.Germany.read);
            
Ger.r2.h = calcR2([newData.Germany.teacher_exp, newData.Germany.clsize, ...
                    newData.Germany.teacher_exp./newData.Germany.clsize], ...
                    Ger.h.betas, newData.Germany.read);
                
Ger.r2.i = calcR2([newData.Germany.teacher_exp, newData.Germany.teacher_exp.^2, ...
                    newData.Germany.teacher_exp.^3], ...
                    Ger.i.betas, newData.Germany.read);
% r2: the closer to 1,  the better. The closer to 0, the worse

Ger.stats = stats(voi,vois);

%res = createPlots(Ger.functions.b, data.Germany.title)
createPlots(Ger.functions.b,[newData.Germany.read, newData.Germany.teacher_exp,...
            newData.Germany.clsize], data.Germany.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};
% Hypotesetester
% hvis h = 0, forkastes ikke null-hypotesen                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    
 %%%%%%%%%%%%% CLASS WISE ESTIMATIONS %%%%%%%%%%%%%%%%%%%%%%%%%

newData.Norway = statsClasses(newData.Norway);
Nor.class.a = newData.Norway.statistics.TeachExp.pltmat; % read on top, exp on buttom.
Nor.class.b =  [newData.Norway.statistics.TeachExp.pltmat; ....
                    newData.Norway.statistics.clsize.classSizes]; %read top, exp mid, cl but.
Nor.class.h = [newData.Norway.statistics.TeachExp.pltmat; ....
                    newData.Norway.statistics.clsize.classSizes; ...
                    newData.Norway.statistics.TeachExp.teachExpScores./ ....
                    newData.Norway.statistics.clsize.classSizes];
Nor.class.i = [ ...
newData.Norway.statistics.TeachExp.pltmat; ....
newData.Norway.statistics.TeachExp.teachExpScores.*...
    newData.Norway.statistics.TeachExp.teachExpScores; ...
newData.Norway.statistics.TeachExp.teachExpScores.*...
    newData.Norway.statistics.TeachExp.teachExpScores.*...
        newData.Norway.statistics.TeachExp.teachExpScores]; %cubic
    
 Nor.class.functions = struct;
 Nor.class.functions.a = estimering(Nor.class.a(1,:),Nor.class.a(2,:));
 Nor.class.functions.b = estimering(Nor.class.b(1,:),Nor.class.b(2,:), ...
                                    Nor.class.b(3,:));
 Nor.class.functions.h = estimering(Nor.class.h(1,:),Nor.class.h(2,:), ...
                                    Nor.class.h(3,:),Nor.class.h(4,:));                               
 Nor.class.functions.i.betas = polyfit(newData.Norway.statistics.TeachExp.pltmat(2,:),...
                    newData.Norway.statistics.TeachExp.pltmat(1,:),3); % cubic       

 Nor.class.functions.a.r2 = calcR2([Nor.class.a(2,:)'], Nor.class.functions.a.betas, ...
    Nor.class.a(1,:));                

 Nor.class.functions.b.r2 = calcR2([Nor.class.b(2,:)', Nor.class.b(3,:)'], ...
                                    Nor.class.functions.b.betas, Nor.class.b(1,:)');
                                
 Nor.class.functions.h.r2 = calcR2([Nor.class.h(2,:)', Nor.class.h(3,:)', ...
                                Nor.class.h(4,:)'], Nor.class.functions.h.betas, ...
                                    Nor.class.h(1,:)');                
                
 Nor.class.functions.i.r2 = calcR2([newData.Norway.statistics.TeachExp.pltmat(2,:)', ...
    newData.Norway.statistics.TeachExp.pltmat(2,:)'.^2,...
    newData.Norway.statistics.TeachExp.pltmat(2,:)'.^3], Nor.class.functions.i.betas, ...
    newData.Norway.statistics.TeachExp.pltmat(1,:));  
                
newData.Germany = statsClasses(newData.Germany);                
Ger.class.a = newData.Germany.statistics.TeachExp.pltmat; % read on top, exp on buttom.
Ger.class.b =  [newData.Germany.statistics.TeachExp.pltmat; ....
                    newData.Germany.statistics.clsize.classSizes]; %read top, exp mid, cl but.
Ger.class.h = [newData.Germany.statistics.TeachExp.pltmat; ....
                    newData.Germany.statistics.clsize.classSizes; ...
                    newData.Germany.statistics.TeachExp.teachExpScores./ ....
                    newData.Germany.statistics.clsize.classSizes];
Ger.class.i = [ ...
newData.Germany.statistics.TeachExp.pltmat; ....
newData.Germany.statistics.TeachExp.teachExpScores.*...
    newData.Germany.statistics.TeachExp.teachExpScores; ...
newData.Germany.statistics.TeachExp.teachExpScores.*...
    newData.Germany.statistics.TeachExp.teachExpScores.*...
        newData.Germany.statistics.TeachExp.teachExpScores]; %cubic
    
 Ger.class.functions = struct;
 Ger.class.functions.a = estimering(Ger.class.a(1,:),Ger.class.a(2,:));
 Ger.class.functions.b = estimering(Ger.class.b(1,:),Ger.class.b(2,:), ...
                                    Ger.class.b(3,:));
 Ger.class.functions.h = estimering(Ger.class.h(1,:),Ger.class.h(2,:), ...
                                    Ger.class.h(3,:),Ger.class.h(4,:));                               
 Ger.class.functions.i.betas = polyfit(newData.Germany.statistics.TeachExp.pltmat(2,:),...
                    newData.Germany.statistics.TeachExp.pltmat(1,:),3); % cubic    
                
 Ger.class.functions.a.r2 = calcR2([Ger.class.a(2,:)'], Ger.class.functions.a.betas, ...
    Ger.class.a(1,:));                

 Ger.class.functions.b.r2 = calcR2([Ger.class.b(2,:)', Ger.class.b(3,:)'], ...
                                    Ger.class.functions.b.betas, Ger.class.b(1,:)');
                                
 Ger.class.functions.h.r2 = calcR2([Ger.class.h(2,:)', Ger.class.h(3,:)', ...
                                Ger.class.h(4,:)'], Ger.class.functions.h.betas, ...
                                    Ger.class.h(1,:)');                
                
 Ger.class.functions.i.r2 = calcR2([newData.Germany.statistics.TeachExp.pltmat(2,:)', ...
    newData.Germany.statistics.TeachExp.pltmat(2,:)'.^2,...
    newData.Germany.statistics.TeachExp.pltmat(2,:)'.^3], Ger.class.functions.i.betas, ...
    newData.Germany.statistics.TeachExp.pltmat(1,:));  
                

                                
newData.USA = statsClasses(newData.USA);                               
USA.class.a = newData.USA.statistics.TeachExp.pltmat; % read on top, exp on buttom.
USA.class.b =  [newData.USA.statistics.TeachExp.pltmat; ....
                    newData.USA.statistics.clsize.classSizes]; %read top, exp mid, cl but.
USA.class.h = [newData.USA.statistics.TeachExp.pltmat; ....
                    newData.USA.statistics.clsize.classSizes; ...
                    newData.USA.statistics.TeachExp.teachExpScores./ ....
                    newData.USA.statistics.clsize.classSizes];
USA.class.i = [ ...
newData.USA.statistics.TeachExp.pltmat; ....
newData.USA.statistics.TeachExp.teachExpScores.*...
    newData.USA.statistics.TeachExp.teachExpScores; ...
newData.USA.statistics.TeachExp.teachExpScores.*...
    newData.USA.statistics.TeachExp.teachExpScores.*...
        newData.USA.statistics.TeachExp.teachExpScores]; %cubic
    

    
 USA.class.functions = struct;
 USA.class.functions.a = estimering(USA.class.a(1,:),USA.class.a(2,:));
 USA.class.functions.b = estimering(USA.class.b(1,:),USA.class.b(2,:), ...
                                    USA.class.b(3,:));
 USA.class.functions.h = estimering(USA.class.h(1,:),USA.class.h(2,:), ...
                                    USA.class.h(3,:),USA.class.h(4,:));                               
 USA.class.functions.i.betas = polyfit(newData.USA.statistics.TeachExp.pltmat(2,:),...
                    newData.USA.statistics.TeachExp.pltmat(1,:),3); % cubic
    
 USA.class.functions.a.r2 = calcR2([USA.class.a(2,:)'], USA.class.functions.a.betas, ...
    USA.class.a(1,:));                

 USA.class.functions.b.r2 = calcR2([USA.class.b(2,:)', USA.class.b(3,:)'], ...
                                    USA.class.functions.b.betas, USA.class.b(1,:)');
                                
 USA.class.functions.h.r2 = calcR2([USA.class.h(2,:)', USA.class.h(3,:)', ...
                                USA.class.h(4,:)'], USA.class.functions.h.betas, ...
                                    USA.class.h(1,:)');                
                
 USA.class.functions.i.r2 = calcR2([newData.USA.statistics.TeachExp.pltmat(2,:)', ...
    newData.USA.statistics.TeachExp.pltmat(2,:)'.^2,...
    newData.USA.statistics.TeachExp.pltmat(2,:)'.^3], USA.class.functions.i.betas, ...
    newData.USA.statistics.TeachExp.pltmat(1,:));  
  
%%%%%%%%%%%%%%%%%%%%%% VERDENSBASIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


myWorld = struct;
% Big World - uncomment this and comment out "small world"
% myWorld.read = [
%     newData.Norway.read;newData.Argentina.read;newData.Belize.read; ...
%     newData.Germany.read;newData.Bulgaria.read;newData.Canada.read; ...
%     newData.USA.read;newData.Colombia.read;newData.Cyprus.read;
%     newData.CzechRep.read;newData.England.read;newData.France.read; ...
%     newData.Greece.read;newData.HongKong.read;newData.Hungary.read; ...
%     newData.Iran.read;newData.Italy.read;newData.Kuwait.read;...
%     newData.Latvia.read;newData.Lithuania.read;newData.Macedonia.read; ...
%     newData.Moldova.read;newData.Morocco.read;newData.Netherlands.read; ...
%     newData.Romania.read;newData.Russia.read;newData.Scotland.read;
%     newData.Singapore.read;newData.Slovakia.read;newData.Slovenia.read; ...
%     newData.Sweden.read;newData.Turkey.read];
%           
% myWorld.teacher_exp = [  newData.Norway.teacher_exp;newData.Argentina.teacher_exp;...
%     newData.Belize.teacher_exp; ...
%     newData.Germany.teacher_exp;newData.Bulgaria.teacher_exp;newData.Canada.teacher_exp; ...
%     newData.USA.teacher_exp;newData.Colombia.teacher_exp;newData.Cyprus.teacher_exp;
%     newData.CzechRep.teacher_exp;newData.England.teacher_exp;newData.France.teacher_exp; ...
%     newData.Greece.teacher_exp;newData.HongKong.teacher_exp;newData.Hungary.teacher_exp; ...
%     newData.Iran.teacher_exp;newData.Italy.teacher_exp;newData.Kuwait.teacher_exp;...
%     newData.Latvia.teacher_exp;newData.Lithuania.teacher_exp;newData.Macedonia.teacher_exp; ...
%     newData.Moldova.teacher_exp;newData.Morocco.teacher_exp;newData.Netherlands.teacher_exp; ...
%     newData.Romania.teacher_exp;newData.Russia.teacher_exp;newData.Scotland.teacher_exp;
%     newData.Singapore.teacher_exp;newData.Slovakia.teacher_exp;newData.Slovenia.teacher_exp; ...
%     newData.Sweden.teacher_exp;newData.Turkey.teacher_exp];
%                   
% myWorld.clsize = [  newData.Norway.clsize;newData.Argentina.clsize;...
%     newData.Belize.clsize; ...
%     newData.Germany.clsize;newData.Bulgaria.clsize;newData.Canada.clsize; ...
%     newData.USA.clsize;newData.Colombia.clsize;newData.Cyprus.clsize;
%     newData.CzechRep.clsize;newData.England.clsize;newData.France.clsize; ...
%     newData.Greece.clsize;newData.HongKong.clsize;newData.Hungary.clsize; ...
%     newData.Iran.clsize;newData.Italy.clsize;newData.Kuwait.clsize;...
%     newData.Latvia.clsize;newData.Lithuania.clsize;newData.Macedonia.clsize; ...
%     newData.Moldova.clsize;newData.Morocco.clsize;newData.Netherlands.clsize; ...
%     newData.Romania.clsize;newData.Russia.clsize;newData.Scotland.clsize;
%     newData.Singapore.clsize;newData.Slovakia.clsize;newData.Slovenia.clsize; ...
%     newData.Sweden.clsize;newData.Turkey.clsize];

% Small World
myWorld.read = [newData.Norway.read; ...
              newData.Germany.read; ...
              newData.USA.read];
          
myWorld.teacher_exp = [newData.Norway.teacher_exp; ...
                     newData.Germany.teacher_exp; ...
                      newData.USA.teacher_exp];
                  
myWorld.clsize = [newData.Norway.clsize; ...
                     newData.Germany.clsize; ...
                      newData.USA.clsize];      
   
myWorld.number = length(myWorld.read); myWorld.title = 'The World';

variblesOfInterest = {myWorld.read, myWorld.teacher_exp, ...
                      myWorld.clsize};
voi = variblesOfInterest; %just shorter

myWorld.stats = stats(voi,vois);
myWorld = classFinder(myWorld, vois);

res.myWorld = plotClases(myWorld.class, myWorld.title,'m');

%%%%%%%%%% INDIVIDUELT %%%%%%%%%%%
myWorld.a = estimering(myWorld.read, myWorld.teacher_exp); 

myWorld.b = estimering(myWorld.read, myWorld.teacher_exp, myWorld.clsize);

myWorld.h = estimering(myWorld.read, myWorld.teacher_exp,...
                            myWorld.clsize, myWorld.teacher_exp./...
                                                         myWorld.clsize);
myWorld.i.betas = polyfit(myWorld.teacher_exp, myWorld.read,3); %cubic function  

myWorld.functions.a = functionFinder(myWorld.a.betas, myWorld.teacher_exp);
myWorld.functions.b = functionFinder(myWorld.b.betas, myWorld.teacher_exp,myWorld.clsize);
myWorld.functions.h = functionFinder(myWorld.h.betas, myWorld.teacher_exp, myWorld.clsize, ...
                                 myWorld.teacher_exp./myWorld.clsize);
myWorld.functions.i = @(x) myWorld.i.betas * [x^3;x^2;x;1];


myWorld.r2.a = calcR2(myWorld.teacher_exp, myWorld.a.betas, myWorld.read);

myWorld.r2.b = calcR2([myWorld.teacher_exp, myWorld.clsize],...
                myWorld.b.betas, myWorld.read);
            
myWorld.r2.h = calcR2([myWorld.teacher_exp, myWorld.clsize, ...
                    myWorld.teacher_exp./myWorld.clsize], ...
                    myWorld.h.betas, myWorld.read);
                
myWorld.r2.i = calcR2([myWorld.teacher_exp, myWorld.teacher_exp.^2, ...
                    myWorld.teacher_exp.^3], ...
                    myWorld.i.betas, myWorld.read);

createPlots(myWorld.functions.b,[myWorld.read, myWorld.teacher_exp,...
            myWorld.clsize], myWorld.title, vois)
%%%%%%%% KLASSEVIS %%%%%%%%%
myWorld = statsClasses(myWorld);

myWorld.class.a = myWorld.statistics.TeachExp.pltmat; % read on top, exp on buttom.
myWorld.class.b =  [myWorld.statistics.TeachExp.pltmat; ....
                    myWorld.statistics.clsize.classSizes]; %read top, exp mid, cl but.
myWorld.class.h = [myWorld.statistics.TeachExp.pltmat; ....
                    myWorld.statistics.clsize.classSizes; ...
                    myWorld.statistics.TeachExp.teachExpScores./ ....
                    myWorld.statistics.clsize.classSizes];
myWorld.class.i = [ ...
myWorld.statistics.TeachExp.pltmat; ....
myWorld.statistics.TeachExp.teachExpScores.*...
    myWorld.statistics.TeachExp.teachExpScores; ...
myWorld.statistics.TeachExp.teachExpScores.*...
    myWorld.statistics.TeachExp.teachExpScores.*...
        myWorld.statistics.TeachExp.teachExpScores]; %cubic
    
 myWorld.class.functions = struct;
 myWorld.class.functions.a = estimering(myWorld.class.a(1,:),myWorld.class.a(2,:));
 myWorld.class.functions.b = estimering(myWorld.class.b(1,:),myWorld.class.b(2,:), ...
                                    myWorld.class.b(3,:));
 myWorld.class.functions.h = estimering(myWorld.class.h(1,:),myWorld.class.h(2,:), ...
                                    myWorld.class.h(3,:),myWorld.class.h(4,:));                               
 myWorld.class.functions.i.betas = polyfit(myWorld.statistics.TeachExp.pltmat(2,:),...
                    myWorld.statistics.TeachExp.pltmat(1,:),3); % cubic       

 myWorld.class.functions.a.r2 = calcR2([myWorld.class.a(2,:)'], myWorld.class.functions.a.betas, ...
    myWorld.class.a(1,:));                

 myWorld.class.functions.b.r2 = calcR2([myWorld.class.b(2,:)', myWorld.class.b(3,:)'], ...
                                    myWorld.class.functions.b.betas, myWorld.class.b(1,:)');
                                
 myWorld.class.functions.h.r2 = calcR2([myWorld.class.h(2,:)', myWorld.class.h(3,:)', ...
                                myWorld.class.h(4,:)'], myWorld.class.functions.h.betas, ...
                                    myWorld.class.h(1,:)');                
                
 myWorld.class.functions.i.r2 = calcR2([myWorld.statistics.TeachExp.pltmat(2,:)', ...
    myWorld.statistics.TeachExp.pltmat(2,:)'.^2,...
    myWorld.statistics.TeachExp.pltmat(2,:)'.^3], myWorld.class.functions.i.betas, ...
    myWorld.statistics.TeachExp.pltmat(1,:));  

run Testorama
%% Function List

% Function for one-variable regresion
function [b_0, b_1, c] = estimeringEnVar (y, x1, n)
if nargin < 3
    n = length(y);
end

    c = struct;
    c.my = cov(y,x1);
    c.m11 = var(x1);
    
    m_y1 = c.my(1,2) *(n-1);
    m_11 = c.m11 *(n-1);
    
    b_1 = m_y1 / m_11;
    
    if isnan(b_1)
        b_1 = 0;
    end %if
    
    b_0 =  mean(y) - b_1 * mean(x1);
    
end

% Function for two-variable regresion
function [b_0, b_1, b_2, c] = estimeringToVar (y, x2, x3, n)
%c = container - struct.
if nargin < 4
    n = length(y);
end

c = struct;
c.my2 = cov(y,x2); if size(c.my2) == 1; c.my2 = ones(2,2).*c.my2; end
c.my3 = cov(y,x3); if size(c.my3) == 1; c.my3 = ones(2,2).*c.my3; end
c.m23 = cov(x2,x3); if size(c.m23) == 1; c.m23 = ones(2,2).*c.m23; end

c.m22 = var(x2);
c.m33 = var(x3);

m_y2 = c.my2(1,2) * (n-1);
m_y3 = c.my3(1,2) * (n-1);
m_23 = c.m23(1,2) * (n-1);
m_22 = c.m22 * (n-1);
m_33 = c.m33 * (n-1);

b_1 = (m_y2*m_33 - m_y3*m_23) / ...
        (m_22*m_33 - (m_23).^2);
    
    if isnan(b_1)
        b_1 = 0;
    end %if

b_2 = (m_y3*m_22 - m_y2*m_23) / ...
        (m_22*m_33 - (m_23).^2);
    
    if isnan(b_2)
        b_2 = 0;
    end %if

b_0 = mean(y) - b_1 * mean(x2) - b_2 * mean(x3);
if isnan(b_1); b_1 = 0;end %if
end

% Function for three-variable regresion
function [b_1, b_2, b_3, b_4, c] = estimeringTreVar (y, x2, x3, x4, n)

if nargin < 5
    n = length(y);
end

%c = container - struct
c = struct;
c.my2 = cov(y,x2); if size(c.my2) == 1; c.my2 = ones(2,2).*c.my2; end
c.my3 = cov(y,x3); if size(c.my3) == 1; c.my3 = ones(2,2).*c.my3; end
c.my4 = cov(y,x4); if size(c.my4) == 1; c.my4 = ones(2,2).*c.my4; end

c.m23 = cov(x2,x3); if size(c.m23) == 1; c.m23 = ones(2,2).*c.m23; end
c.m24 = cov(x2,x4); if size(c.m24) == 1; c.m24 = ones(2,2).*c.m24; end
c.m34 = cov(x3,x4); if size(c.m34) == 1; c.m34 = ones(2,2).*c.m34; end

c.m22 = var(x2); 
c.m33 = var(x3); 
c.m44 = var(x4); 

m_y2 = c.my2(1,2) * (n-1);
m_y3 = c.my3(1,2) * (n-1);
m_y4 = c.my4(1,2) * (n-1);
m_23 = c.m23(1,2) * (n-1);
m_24 = c.m24(1,2) * (n-1);
m_34 = c.m34(1,2) * (n-1);

m_22 = c.m22 * (n-1);
m_33 = c.m33 * (n-1);
m_44 = c.m44 * (n-1);

m_mat = [ m_22 m_23 m_24; ...
          m_23 m_33 m_34; ...
          m_24 m_34 m_44 ];

my_mat = [m_y2; m_y3; m_y4];

b_vec = m_mat\my_mat;

b_2 = b_vec(1); if isnan(b_2); b_2 = 0;end %if
b_3 = b_vec(2); if isnan(b_3); b_3 = 0;end %if
b_4 = b_vec(3); if isnan(b_4); b_4 = 0;end %if

b_1 = mean(y) - b_2 * mean(x2) - b_3 * mean(x3) - b_4 * mean(x4);
if isnan(b_1); b_1 = 0;end %if

end

function [b_1, b_2, b_3, b_4, b_5, c] = estimeringFireVar (y, x2, x3, x4, x5, n)

if nargin < 6
    n = length(y);
end

c = struct;

c.my2 = cov(y,x2); if size(c.my2) == 1; c.my2 = ones(2,2).*c.my2; end
c.my3 = cov(y,x3); if size(c.my3) == 1; c.my3 = ones(2,2).*c.my3; end
c.my4 = cov(y,x4); if size(c.my4) == 1; c.my4 = ones(2,2).*c.my4; end
c.my5 = cov(y,x5); if size(c.my5) == 1; c.my5 = ones(2,2).*c.my5; end

c.m23 = cov(x2,x3); if size(c.m23) == 1; c.m23 = ones(2,2).*c.m23; end
c.m24 = cov(x2,x4); if size(c.m24) == 1; c.m24 = ones(2,2).*c.m24; end 
c.m25 = cov(x2,x5); if size(c.m25) == 1; c.m25 = ones(2,2).*c.m25; end

c.m34 = cov(x3,x4); if size(c.m34) == 1; c.m34 = ones(2,2).*c.m34; end
c.m35 = cov(x3,x5); if size(c.m35) == 1; c.m35 = ones(2,2).*c.m35; end

c.m45 = cov(x4,x5); if size(c.m45) == 1; c.m45 = ones(2,2).*c.m45; end

c.m22 = var(x2);
c.m33 = var(x3);
c.m44 = var(x4);
c.m55 = var(x5);

m_y2 = c.my2(1,2) * (n-1);
m_y3 = c.my3(1,2) * (n-1);
m_y4 = c.my4(1,2) * (n-1);
m_y5 = c.my5(1,2) * (n-1);

m_23 = c.m23(1,2) * (n-1);
m_24 = c.m24(1,2) * (n-1);
m_25 = c.m25(1,2) * (n-1);

m_34 = c.m34(1,2) * (n-1);
m_35 = c.m35(1,2) * (n-1);

m_45 = c.m45(1,2) * (n-1);

m_22 = c.m22 * (n-1);
m_33 = c.m33 * (n-1);
m_44 = c.m44 * (n-1);
m_55 = c.m55 * (n-1);


m_mat = [ m_22 m_23 m_24 m_25; ...
          m_23 m_33 m_34 m_35; ...
          m_24 m_34 m_44 m_45;
          m_25 m_35 m_45 m_55;];

my_mat = [m_y2; m_y3; m_y4; m_y5];

b_vec = m_mat\my_mat;

b_2 = b_vec(1); if isnan(b_2); b_2 = 0;end %if
b_3 = b_vec(2); if isnan(b_3); b_3 = 0;end %if
b_4 = b_vec(3); if isnan(b_4); b_4 = 0;end %if
b_5 = b_vec(4); if isnan(b_5); b_5 = 0;end %if

b_1 = mean(y) - b_2 * mean(x2) - b_3 * mean(x3) ...
     - b_4 * mean(x4) - b_5 * mean(x5);
if isnan(b_1); b_1 = 0;end %if
end

% Function for five-variable regresion
function [b_1, b_2, b_3, b_4, b_5, b_6, c] = estimeringFemVar (y, x2, x3, x4, x5, x6, n)

if nargin < 6
    n = length(y);
end

c = struct;

c.my2 = cov(y,x2); if size(c.my2) == 1; c.my2 = ones(2,2).*c.my2; end
c.my3 = cov(y,x3); if size(c.my3) == 1; c.my3 = ones(2,2).*c.my3; end
c.my4 = cov(y,x4); if size(c.my4) == 1; c.my4 = ones(2,2).*c.my4; end
c.my5 = cov(y,x5); if size(c.my5) == 1; c.my5 = ones(2,2).*c.my5; end
c.my6 = cov(y,x6); if size(c.my6) == 1; c.my6 = ones(2,2).*c.my6; end

c.m23 = cov(x2,x3); if size(c.m23) == 1; c.m23 = ones(2,2).*c.m23; end
c.m24 = cov(x2,x4); if size(c.m24) == 1; c.m24 = ones(2,2).*c.m24; end
c.m25 = cov(x2,x5); if size(c.m25) == 1; c.m25 = ones(2,2).*c.m25; end
c.m26 = cov(x2,x6); if size(c.m26) == 1; c.m26 = ones(2,2).*c.m26; end

c.m34 = cov(x3,x4); if size(c.m34) == 1; c.m34 = ones(2,2).*c.m34; end
c.m35 = cov(x3,x5); if size(c.m35) == 1; c.m35 = ones(2,2).*c.m35; end
c.m36 = cov(x3,x6); if size(c.m36) == 1; c.m36 = ones(2,2).*c.m36; end

c.m45 = cov(x4,x5); if size(c.m45) == 1; c.m45 = ones(2,2).*c.m45; end
c.m46 = cov(x4,x6); if size(c.m46) == 1; c.m46 = ones(2,2).*c.m46; end

c.m56 = cov(x5,x6); if size(c.m56) == 1; c.m56 = ones(2,2).*c.m56; end

c.m22 = var(x2);
c.m33 = var(x3);
c.m44 = var(x4);
c.m55 = var(x5);
c.m66 = var(x6);

m_y2 = c.my2(1,2) * (n-1);
m_y3 = c.my3(1,2) * (n-1);
m_y4 = c.my4(1,2) * (n-1);
m_y5 = c.my5(1,2) * (n-1);
m_y6 = c.my6(1,2) * (n-1);

m_23 = c.m23(1,2) * (n-1);
m_24 = c.m24(1,2) * (n-1);
m_25 = c.m25(1,2) * (n-1);
m_26 = c.m26(1,2) * (n-1);

m_34 = c.m34(1,2) * (n-1);
m_35 = c.m35(1,2) * (n-1);
m_36 = c.m36(1,2) * (n-1);

m_45 = c.m45(1,2) * (n-1);
m_46 = c.m46(1,2) * (n-1);

m_56 = c.m56(1,2) * (n-1);

m_22 = c.m22 * (n-1);
m_33 = c.m33 * (n-1);
m_44 = c.m44 * (n-1);
m_55 = c.m55 * (n-1);
m_66 = c.m66 * (n-1);


m_mat = [ m_22 m_23 m_24 m_25 m_26; ...
          m_23 m_33 m_34 m_35 m_36; ...
          m_24 m_34 m_44 m_45 m_46;
          m_25 m_35 m_45 m_55 m_56;
          m_26 m_36 m_46 m_56 m_66];

my_mat = [m_y2; m_y3; m_y4; m_y5; m_y6];

b_vec = m_mat\my_mat;

b_2 = b_vec(1); if isnan(b_2); b_2 = 0;end %if
b_3 = b_vec(2); if isnan(b_3); b_3 = 0;end %if
b_4 = b_vec(3); if isnan(b_4); b_4 = 0;end %if
b_5 = b_vec(4); if isnan(b_5); b_5 = 0;end %if
b_6 = b_vec(5); if isnan(b_6); b_6 = 0;end %if

b_1 = mean(y) - b_2 * mean(x2) - b_3 * mean(x3) ...
     - b_4 * mean(x4) - b_5 * mean(x5) - b_6 * mean(x6);
if isnan(b_1); b_1 = 0;end %if 
end

function r2 = calcR2(x, B, yi)
%x = x'; %På form [a;b;c] der a, b og c er vektorer av lik lengde, vil dette
        %få matrisen på rett form videre
B = B'; %[b0, b1, b2 ...]

[row,col] = size(x);

X = ones(row, col+1);

for i = 2:col+1
    X(:,i) = x(:,i-1);    
end %for
y_bar = mean(yi);
y_est = X*B;

r2 = sum((y_est-y_bar).^2)/sum((yi-y_bar).^2);
end

function [bestVec, NewNum, HR] = cleanUp(oldVec)

orgNum = length(oldVec);
NewNum = orgNum;
n = 1;
j = 1;

for i = 1:orgNum
    
    if isempty(oldVec(i))
        NewNum = NewNum -1;
    else 
        newVec(n) = oldVec(i);
        n = n+1;
    end %if
    
end %for

if iscell (newVec)
    newVec = cell2mat(newVec);
end %if

for k = 1:length(newVec)
    if isnan(newVec(k))
        NewNum = NewNum -1;
    else
        bestVec(j) = newVec(k);
        j = j+1;
    end %if

end %for

HR = NewNum/orgNum;
end %function

function [SortedStruct, HR,n] = sortInfo (cSort, cReq, listNames, value)

   % cSort: vektor som skal sorteres
   % cReq: Cell array, inneholder vektorene som skal taes med videre, 
   % feks:{data.educ, data.black, data.wage}
   % listNames: cell array, navnet som de får i structen
   % value: den verdien de skal ha
   
   % SortedStruct: sortert struct
   % n: antall tilfeller som passet
   % HR: Hit rate, andelen som ble med videre
   
    SortedStruct = struct;
    posisjon = 0;
    number   = length(cSort);
    for tempPos = 1:number
        if cSort(tempPos) == value
            posisjon = posisjon +1;
            %SortedStruct = sortInfoFunc(cReq, listNames, posisjon, tempPos);
            lengdeListe = length(cReq);
                if posisjon == 1
                    SortedStruct = struct;
                    for k = 1:lengdeListe
                    SortedStruct.(listNames{k}) = []; 
                    end%for
                end%if
                for k = 1:lengdeListe
                    SortedStruct.(listNames{k}) = [SortedStruct.(listNames{k}); cReq{k}(tempPos)]; 
                end%for
         end %if
    end %for
    n = posisjon;
    HR = n / number;
    if HR == 0
        SortedStruct = zero2struct(listNames);
    end %if
end %function


function [SortedStruct] = stats(intrestFields,intrestFieldsString)
    %SortedStruct = struct;
    n = length(intrestFields);
    m = length(intrestFieldsString);
    if m ~= n
        error ('Mismatch intrestFields and intrestFieldsString')
    end %if 
    
    while n>0
        if n > 1
            name = intrestFieldsString{n};
            [SortedStruct.(name)] = recursStat2(intrestFields{n}, intrestFields{n-1});   
        else
            name = intrestFieldsString{n};
            [SortedStruct.(name)] = recursStat(intrestFields{n});
        end %if
        n = n-1;
    end %while
end %function

function [stract] = recursStat(field)
     stract.mean = mean(field);
     stract.stdavvik = std(field);
     stract.max = max(field);
     stract.min = min(field);
end %function

function [stract] = recursStat2(MainField, otherField)
    % otherField = n-1 i field posisjon
     stract.mean = mean(MainField);
     stract.stdavvik = std(MainField);
     stract.max = max(MainField);
     stract.min = min(MainField);
     stract.cov = cov(MainField, otherField);
end %function

function [container] = zero2struct(intrestFieldsString)

    container = struct;
    n = length(intrestFieldsString);
    
    while n>0
         name = intrestFieldsString{n};
         [container.(name)] = 0;  
        n = n-1;
    end %while


end %function

function [posisjonOfVOIS] = findVOIS(variblesOfInterestString, allVaribles)
posisjonOfVOIS = [];
for i = 1:length(variblesOfInterestString)
    for j = 1:length(allVaribles)
        if strcmp(variblesOfInterestString{i}, ...
                   allVaribles{j})
           posisjonOfVOIS = [posisjonOfVOIS,j];
        end %if     
    end %for j
end %for i

end %function

function c = estimering(y, x1, x2, x3, x4, x5)
% c = contianer;
%c = struct;
if nargin < 2 || nargin > 6
    error 'not enough arguments (less than 2) or too many (more than 6)'
elseif nargin == 2
    [b1_1, b1_2, c] = estimeringEnVar (y, x1);
    c.betas = [b1_1, b1_2];
elseif nargin == 3
    [b2_1, b2_2, b2_3, c] = estimeringToVar (y, x1, x2);
    c.betas = [b2_1, b2_2, b2_3];
elseif nargin == 4
    [b3_1, b3_2, b3_3, b3_4, c] = estimeringTreVar (y, x1, x2, x3);
    c.betas = [b3_1, b3_2, b3_3, b3_4];
elseif nargin == 5
    [b4_1, b4_2, b4_3, b4_4, b4_5, c] = estimeringFireVar (y, x1, x2, x3, x4);
     c.betas = [b4_1, b4_2, b4_3, b4_4, b4_5];
elseif nargin == 6
    [b5_1, b5_2, b5_3, b5_4, b5_5, b5_6, c] = estimeringFemVar (y, x1, x2, x3, x4, x5);
     c.betas = [b5_1, b5_2, b5_3, b5_4, b5_5, b5_6];
end %if
c.arguments = length(c.betas)-1;
end %function

function f = functionFinder(betas, x1, x2, x3, x4, x5)
    if nargin == 2
        f = @(x) betas * [1;x];         
    elseif nargin == 3
        f.total = @(x,y) betas * [1;x;y];
        f.d_1 = @(x) betas * [1;x;mean(x2)];
        f.d_2 = @(x) betas * [1;mean(x1);x];
    elseif nargin == 4
        f.total = @(x,y,z) betas * [1;x;y;z];
        f.d_1 = @(x) betas * [1;x;mean(x2);mean(x3)];
        f.d_2 = @(x) betas * [1;mean(x1);x;mean(x3)];
        f.d_3 = @(x) betas * [1;mean(x1);mean(x2);x];
    elseif nargin == 5
        f.total = @(x,y,z,u) betas * [1;x;y;z;u];
        f.d_1 = @(x) betas * [1;x;mean(x2);mean(x3);mean(x4)];
        f.d_2 = @(x) betas * [1;mean(x1);x;mean(x3);mean(x4)];
        f.d_3 = @(x) betas * [1;mean(x1);mean(x2);x;mean(x4)];
        f.d_4 = @(x) betas * [1;mean(x1);mean(x2);mean(x3);x];
    elseif nargin == 6
        f.total = @(x,y,z,u,v) betas * [1;x;y;z;u;v];
        f.d_1 = @(x) betas * [1;x;mean(x2);mean(x3);mean(x4);mean(x5)];
        f.d_2 = @(x) betas * [1;mean(x1);x;mean(x3);mean(x4);mean(x5)];
        f.d_3 = @(x) betas * [1;mean(x1);mean(x2);x;mean(x4);mean(x5)];
        f.d_4 = @(x) betas * [1;mean(x1);mean(x2);mean(x3);x;mean(x5)];
        f.d_5 = @(x) betas * [1;mean(x1);mean(x2);mean(x3);mean(x4);x];
    end%if    
end % function

function [] = createFigures(functionPartOfStructs,orgAllData, title)
    %letter = char(number + 64);
   for i = 1:length(fieldnames(...
                functionPartOfStructs)) 
       letter = char(i + 96); 
       if isstruct(functionPartOfStructs.(letter))
             createPlots(functionPartOfStructs.(letter), orgAllData, title)
       end %if
        
   end %for i
    
    
end %function

function [] = createPlots(func, orgAllData, titlestr, lab)
        %orgAllData: [x1;x2;x3] matrise
        number = length(fieldnames(func));
        sz = 10;
        switch number
            case 3
                figure('name', titlestr);
                subplot(4,7, [1,25]);
                fsurf(func.total)
                hold on; grid on;
                scatter3 (orgAllData(:,2),orgAllData(:,3),...
                            orgAllData(:,1), sz)
                hold on; grid on;
                alpha(.62)
                title([lab{3},' og ', lab{2}, ' mot ', lab{1}])
                zlim([min(orgAllData(:,1)) max(orgAllData(:,1))])
                xlim([0 max(orgAllData(:,2))])
                ylim([0 max(orgAllData(:,3))])
                zlabel(lab{1})
                xlabel(lab{2})
                ylabel(lab{3})
                
                
                subplot(4,7,[5,14])
                scatter(orgAllData(:,2),orgAllData(:,1), sz)
                hold on; grid on;
                title([lab{2},' mot ' lab{1}])
                fplot(func.d_1)
                xlim([0 inf])
                xlabel(lab{2})
                ylabel(lab{1})
                
                subplot(4,7,[19,28])
                scatter(orgAllData(:,3),orgAllData(:,1),sz)
                hold on; grid on;
                title([lab{3},' mot ' lab{1}])
                fplot(func.d_2)
                xlim([0 inf])
                xlabel(lab{3})
                ylabel(lab{1})
                
            case 4
                  figure('name', titlestr);
                  
%                 hold on; grid on;
%                 subplot(3,5, [1,13]);
%                 title([lab{4}, ' og ', lab{3},' og ', ...
%                         lab{2}, ' mot ', lab{1}])
%                 fsurf(func.total);alpha(.4)
                
                subplot(3,1,1)
                scatter(orgAllData(:,2),orgAllData(:,1),sz)
                hold on; grid on;
                %fplot(func.d_1)
                xlim([0 inf])
                title([lab{2},' mot ' lab{1}])
                xlabel(lab{2})
                ylabel(lab{1})
                
                subplot(3,1,2)
                scatter(orgAllData(:,3),orgAllData(:,1),sz)
                hold on; grid on;
                %fplot(func.d_2)
                xlim([0 inf])
                title([lab{3},' mot ' lab{1}])
                xlabel(lab{3})
                ylabel(lab{1})
                
                subplot(3,1,3)
                scatter(orgAllData(:,4),orgAllData(:,1),sz)
                hold on; grid on;
                %fplot(func.d_3)
                title([lab{4},' mot ' lab{1}])
                xlim([0 inf])
                xlabel(lab{4})
                ylabel(lab{1})
            case 5
                figure('name', titlestr);
                subplot(4,1,1)
                scatter(orgAllData(:,2),orgAllData(:,1),sz)
                hold on; grid on;
                fplot(func.d_1)
                xlim([0 inf])
                title([lab{2},' mot ' lab{1}])
                xlabel(lab{2})
                ylabel(lab{1})
                
                subplot(4,1,2)
                scatter(orgAllData(:,3),orgAllData(:,1),sz)
                hold on; grid on;
                fplot(func.d_2)
                xlim([0 inf])
                title([lab{3},' mot ' lab{1}])
                xlabel(lab{3})
                ylabel(lab{1})
                
                subplot(4,1,3)
                scatter(orgAllData(:,4),orgAllData(:,1),sz)
                hold on; grid on;
                fplot(func.d_3)
                title([lab{4},' mot ' lab{1}])
                xlim([0 inf])
                xlabel(lab{4})
                ylabel(lab{1}) 
                
                subplot(4,1,4)
                scatter(orgAllData(:,4),orgAllData(:,1),sz)
                hold on; grid on;
                fplot(func.d_4)
                xlim([0 inf])
                title([lab{4},' mot ' lab{1}])
                xlabel(lab{4})
                ylabel(lab{1})
                
            case 6
        end %switch


    end %function

function [structure] = classFinder(structure, vois)
internalCount = 1;
classNumber = 1;
name = nameFinder(classNumber);
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

function [valuedVector] = plotClases(classStructure, ti, color)
names = fieldnames(classStructure);
valuedVector = zeros(4,length(fieldnames(classStructure)));
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

figure; 
hold on; grid on;
scatter(valuedVector(1,:), valuedVector(2,:), valuedVector(4,:).*sf, 'filled',color)
scatter(mean(valuedVector(1,:)),mean(valuedVector(2,:)), mean(valuedVector(4,:)).*sf, 'filled','k')
xlabel('clsize')
ylabel('teacher_exp')
title(ti)
alpha(.35)

end % function

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


 
    
