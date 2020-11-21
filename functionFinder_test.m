function f = functionFinder_test(betas, x1, x2, x3, x4, x5)
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