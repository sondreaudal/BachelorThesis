newData = struct;
[newData.Argentina, newData.Argentina.hitRate] = cleanUpPro(data.Argentina);
[newData.Belize, newData.Belize.hitRate] = cleanUpPro(data.Belize);
[newData.Bulgaria, newData.Bulgaria.hitRate] = cleanUpPro(data.Bulgaria);
[newData.Canada, newData.Canada.hitRate] = cleanUpPro(data.Canada);
[newData.Colombia, newData.Colombia.hitRate] = cleanUpPro(data.Colombia);
[newData.Cyprus, newData.Cyprus.hitRate] = cleanUpPro(data.Cyprus);
[newData.CzechRep, newData.CzechRep.hitRate] = cleanUpPro(data.CzechRep);
[newData.England, newData.England.hitRate] = cleanUpPro(data.England);
[newData.France, newData.France.hitRate] = cleanUpPro(data.France);
[newData.Germany, newData.Germany.hitRate] = cleanUpPro(data.Germany);
[newData.Greece, newData.Greece.hitRate] = cleanUpPro(data.Greece);
[newData.HongKong, newData.HongKong.hitRate] = cleanUpPro(data.HongKong);
[newData.Hungary, newData.Hungary.hitRate] = cleanUpPro(data.Hungary);
[newData.Iran, newData.Iran.hitRate] = cleanUpPro(data.Iran);
[newData.Italy, newData.Italy.hitRate] = cleanUpPro(data.Italy);
[newData.Kuwait, newData.Kuwait.hitRate] = cleanUpPro(data.Kuwait);
[newData.Latvia, newData.Latvia.hitRate] = cleanUpPro(data.Latvia);
[newData.Lithuania, newData.Lithuania.hitRate] = cleanUpPro(data.Lithuania);
[newData.Macedonia, newData.Macedonia.hitRate] = cleanUpPro(data.Macedonia);
[newData.Moldova, newData.Moldova.hitRate] = cleanUpPro(data.Moldova);
[newData.Morocco, newData.Morocco.hitRate] = cleanUpPro(data.Morocco);
[newData.Netherlands, newData.Netherlands.hitRate] = cleanUpPro(data.Netherlands);
[newData.NewZealand, newData.NewZealand.hitRate] = cleanUpPro(data.NewZealand);
[newData.Norway, newData.Norway.hitRate] = cleanUpPro(data.Norway);
[newData.Romania, newData.Romania.hitRate] = cleanUpPro(data.Romania);
[newData.Russia, newData.Russia.hitRate] = cleanUpPro(data.Russia);
[newData.Scotland, newData.Scotland.hitRate] = cleanUpPro(data.Scotland);
[newData.Singapore, newData.Singapore.hitRate] = cleanUpPro(data.Singapore);
[newData.Slovakia, newData.Slovakia.hitRate] = cleanUpPro(data.Slovakia);
[newData.Slovenia, newData.Slovenia.hitRate] = cleanUpPro(data.Slovenia);
[newData.Sweden, newData.Sweden.hitRate] = cleanUpPro(data.Sweden);
[newData.Turkey, newData.Turkey.hitRate] = cleanUpPro(data.Turkey);
[newData.USA, newData.USA.hitRate] = cleanUpPro(data.USA);


function [y, hitRate] = cleanUpPro(y)
orgLength = y.number;
[y.idcntry, y,~] = cleanUp(y.idcntry,y);
[y.idgrade, y,~] = cleanUp(y.idgrade,y);
[y.read,y,~] = cleanUp(y.read,y);
% [y.girl,y,~] = cleanUp(y.girl,y);
% [y.birthm,y,~] = cleanUp(y.birthm,y);
% [y.birthy,y,~] = cleanUp(y.birthy,y);
% [y.age,y,~] = cleanUp(y.age,y);
% [y.not_born,y,~] = cleanUp(y.not_born,y);
% [y.par_not_born,y,~] = cleanUp(y.par_not_born,y);
% [y.early_ability,y,~]= cleanUp(y.early_ability,y);
% [y.par_edu,y,~] = cleanUp(y.par_edu,y);
% [y.income,y,~] = cleanUp(y.income,y);
% [y.kinderg_att,y,~] = cleanUp(y.kinderg_att,y);
% [y.speak_testlang_home,y,~] = cleanUp(y.speak_testlang_home,y);
% [y.books_home,y,~] = cleanUp(y.books_home,y);
% [y.par_emp,y,~] = cleanUp(y.par_emp,y);
[y.clsize,y,~] = cleanUp(y.clsize,y);
[y.teacher_exp,y,~] = cleanUp(y.teacher_exp,y);
%[y.teacher_age,y,~] = cleanUp(y.teacher_age,y);
% [y.teacher_fem,y,~] = cleanUp(y.teacher_fem,y);
[y.teacher_cert,y,~] = cleanUp(y.teacher_cert,y);
%[y.teacher_edu,y,~] = cleanUp(y.teacher_edu,y); %Proven useless for Nor,
%USA, SWE
% [y.pc_class, y, ~] = cleanUp(y.pc_class,y);
% [y.schoolsize4,y,~] = cleanUp(y.schoolsize4,y);
%[y.school_location,y,~] = cleanUp(y.school_location,y);
% [y.pct_disadv,y,~] = cleanUp(y.pct_disadv,y);
% [y.pct_abroad,y,~] = cleanUp(y.pct_abroad,y);
[y.sameteacher4_plus,y,~] = cleanUp(y.sameteacher4_plus,y);
[y.sameteacher1_less, y, newLength, ~] = cleanUp(y.sameteacher1_less,y);

y = cellToMatrix(y);
y.newNumber = newLength;
hitRate = newLength/orgLength;
end

function [bestVec, s, NewNum, HR] = cleanUp(oldVec, s)
orgS = s;
orgNum = length(oldVec);
NewNum = orgNum;
n = 0;
j = 0;

for i = 1:NewNum
    
    if isempty(oldVec(i))
        NewNum = NewNum -1;
        s = deletePos(s,i);
        %i = i-1;
    else
        n = n+1;
        newVec(n) = oldVec(i);
    end %if
    
end %for

if iscell (newVec)
    newVec = cell2mat(newVec);
end %if

delPosition = [];

for k = 1:orgNum
    if isnan(newVec(k))
        NewNum = NewNum -1;
        delPosition = [delPosition, k];
    else
        j = j+1;
        bestVec(j) = newVec(k);
        
    end %if
end %for

loopValue = 0;
for p = 1:length(delPosition)
    a = delPosition(p) - loopValue;
    s = deletePos(s,a);
    loopValue = loopValue +1;
end %for p

HR = NewNum/orgNum;
if HR == 0
    s = orgS; %hvis ingen data, ingen vits å slette alt
    bestVec= [];
    
end%if

end %function

function res = deletePos(res, pos)
res.idcntry(pos) = [];
res.idgrade(pos) = [];
res.read(pos) = [];
res.girl(pos) = [];
res.birthm(pos) = [];
res.birthy(pos) = [];
res.age(pos) = [];
res.not_born (pos) = [];
res.par_not_born(pos) = [];
res.early_ability (pos) = [];
res.par_edu(pos) = [];
res.income (pos) = [];
res.kinderg_att(pos) = [];
res.speak_testlang_home(pos) = [];
res.books_home(pos) = [];
res.par_emp(pos) = [];
res.clsize(pos) = [];
res.teacher_exp (pos) = [];
res.teacher_age (pos) = [];
res.teacher_fem (pos) = [];
res.teacher_cert(pos) = [];
res.teacher_edu(pos) = [];
res.pc_class(pos) = []; 
res.schoolsize4(pos) = [];
res.school_location (pos) = [];
res.pct_disadv (pos) = [];
res.pct_abroad (pos) = [];
res.sameteacher4_plus (pos) = [];
res.sameteacher1_less(pos) = [];
end

function res = cellToMatrix(res)

if iscell(res.idcntry)
    res.idcntry = cell2mat(res.idcntry);
end

if iscell(res.idgrade) 
    res.idgrade = cell2mat(res.idgrade);
end

if iscell(res.read)
    res.read = cell2mat(res.read);
end

if iscell(res.girl)
    res.girl = cell2mat(res.girl);
end

if iscell(res.birthm)
    res.birthm = cell2mat(res.birthm);
end

if iscell(res.birthy)
    res.birthy = cell2mat(res.birthy);
end

if iscell(res.age)
    res.age = cell2mat(res.age);
end

if iscell(res.not_born)
    res.not_born = cell2mat(res.not_born);
end

if iscell(res.par_not_born)
    res.par_not_born = cell2mat(res.par_not_born);
end

if iscell(res.early_ability)
    res.early_ability = cell2mat(res.early_ability);
end

if iscell(res.par_edu)
    res.par_edu = cell2mat(res.par_edu);
end

if iscell(res.income)
    res.income = cell2mat(res.income);
end

if iscell(res.kinderg_att)
    res.kinderg_att = cell2mat(res.kinderg_att);
end
if iscell(res.speak_testlang_home)
    res.speak_testlang_home = cell2mat (res.speak_testlang_home);
end

if iscell(res.books_home)
    res.books_home = cell2mat(res.books_home);
end

if iscell(res.par_emp)
    res.par_emp = cell2mat(res.par_emp);
end

if iscell(res.clsize)
    res.clsize = cell2mat(res.clsize);
end

if iscell(res.teacher_exp)
    res.teacher_exp = cell2mat(res.teacher_exp);
end

if iscell(res.teacher_age)
    res.teacher_age = cell2mat(res.teacher_age);
end

if iscell(res.teacher_fem)
    res.teacher_fem = cell2mat(res.teacher_fem);
end

if iscell(res.teacher_cert)
    res.teacher_cert = cell2mat(res.teacher_cert);
end

if iscell(res.teacher_edu)
    res.teacher_edu = cell2mat(res.teacher_edu);
end

if iscell(res.pc_class)
    res.pc_class = cell2mat(res.pc_class);
end

if iscell(res.schoolsize4)
    res.schoolsize4 = cell2mat(res.schoolsize4);
end

if iscell(res.school_location)
    res.school_location = cell2mat(res.school_location);
end

if iscell(res.pct_disadv)
    res.pct_disadv = cell2mat(res.pct_disadv);
end

if iscell(res.pct_abroad)
    res.pct_abroad = cell2mat(res.pct_abroad);
end

if iscell(res.sameteacher4_plus)
    res.sameteacher4_plus = cell2mat(res.sameteacher4_plus);
end

if iscell(res.sameteacher1_less)
    res.sameteacher1_less = cell2mat(res.sameteacher1_less);
end

end