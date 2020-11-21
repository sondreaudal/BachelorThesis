 ResStruct.Norway.World = struct;  ResStruct.Germany.World = struct; 
 ResStruct.Germany.Norway = struct;  ResStruct.USA.World = struct; 
 ResStruct.USA.Norway = struct;  ResStruct.USA.Germany = struct; 
 
 
[ResStruct.Norway.World] = testBonanza (ResStruct.Norway.World, ...
                                newData.Norway, myWorld, vois, 0.05, 'both');
[ResStruct.Germany.World] = testBonanza (ResStruct.Germany.World, ...
                                newData.Germany, myWorld, vois, 0.05, 'both');
[ResStruct.Germany.Norway] = testBonanza (ResStruct.Germany.Norway, ...
                                newData.Germany, newData.Norway, vois, 0.05, 'both');
[ResStruct.USA.World] = testBonanza (ResStruct.USA.World, ...
                                newData.USA, myWorld, vois, 0.05, 'both');
[ResStruct.USA.Norway] = testBonanza (ResStruct.USA.Norway, ...
                                newData.USA, newData.Norway, vois, 0.05, 'both');
[ResStruct.USA.Germany] = testBonanza (ResStruct.USA.Germany, ...
                                newData.USA, newData.Germany, vois, 0.05, 'both');                      
Both = ResStruct;  

function [ResStruct] = testBonanza (ResStruct, country1, country2, vois, alpha, tail)
if nargin < 6
    tail = 'both'; %default
end %var6
if nargin < 5
    alpha = 0.05; %default
end % var5

for v = 1:length(vois)
    var1 = country1.(vois{v}); var2 = country2.(vois{v});
    n1 = length(var1); n2 = length(var2);
    
    [h,p,ci,~] = ttest2(var1, var2, 'Alpha', alpha, ...
        'Tail', tail, 'Vartype', 'unequal');
    
    ResStruct.mat.(vois{v}) = {h,p,ci};
    ResStruct.home.reg.(vois{v}) = TwoVarTest(var1, var2, n1, n2,...
        alpha, 0);
    ResStruct.home.mad.(vois{v}) = TwoVarTestMAD(var1, var2, n1, n2,...
        alpha, 0);
end %for v
end %function

function [h0] = TwoVarTest(x1, x2, n1, n2, alfa, diffMu)

    s1 = std(x1); s2 = std(x2);
    avgX1 = mean(x1); avgX2 = mean(x2);

    Zc = ( (avgX1 - avgX2) - diffMu ) / ...
        sqrt(s1^2/n1 + s2^2/n2) ;


    Zv = norminv([alfa/2, 1-alfa/2]);
    %disp(Zv)

    if Zc < min(Zv) || Zc > max(Zv)
        h0 = 'Utafor';
    else
        h0 = 'Innenfor';
    
    end %if

end%function

% Testing two populations to see if common mean
function [h0] = TwoVarTestMAD(x1, x2, n1, n2, alfa, diffMu)

    s1 = mad(x1); s2 = mad(x2);
    avgX1 = mean(x1); avgX2 = mean(x2);

    Zc = ( (avgX1 - avgX2) - diffMu ) / ...
        sqrt(s1^2/n1 + s2^2/n2) ;

    Zv = norminv([alfa/2, 1-alfa/2]);

    if Zc < min(Zv) || Zc > max(Zv)
        h0 = true;
    else
        h0 = false;

    end %if

end%function