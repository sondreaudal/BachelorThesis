Swe = struct; Swe.to = struct; Swe.tre = struct;
variblesOfInterest = {newData.Sweden.(allVaribles{posisjonOfVOIS(1)}), newData.Sweden.(allVaribles{posisjonOfVOIS(2)}), ...
                      newData.Sweden.(allVaribles{posisjonOfVOIS(3)})};
voi = variblesOfInterest; %just shorter

[Swe.T4pluss, Swe.T4pluss.HR, ~] = sortInfo ( newData.Sweden.sameteacher4_plus, voi, vois, 1);
[Swe.T1, Swe.T1.HR, ~] = sortInfo ( newData.Sweden.sameteacher1_less, voi, vois, 1);


T4voi = {Swe.T4pluss.(allVaribles{posisjonOfVOIS(1)}), Swe.T4pluss.(allVaribles{posisjonOfVOIS(2)}), ...
                      Swe.T4pluss.(allVaribles{posisjonOfVOIS(3)})};
T1voi = {Swe.T1.(allVaribles{posisjonOfVOIS(1)}), Swe.T1.(allVaribles{posisjonOfVOIS(2)}), ...
                      Swe.T1.(allVaribles{posisjonOfVOIS(3)})};


Swe.a = estimering(newData.Sweden.(vois{1}), newData.Sweden.(vois{2})); 

Swe.b = estimering(newData.Sweden.(vois{1}), newData.Sweden.(vois{2}), newData.Sweden.(vois{3}));
                       
Swe.c = estimering(Swe.T4pluss.(vois{1}), Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}));

Swe.d = estimering(Swe.T1.(vois{1}), Swe.T1.(vois{2}),Swe.T1.(vois{3}));

Swe.e = estimering(Swe.T4pluss.(vois{1}), Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}), ...
                    Swe.T4pluss.(vois{2})./Swe.T4pluss.(vois{3}));

Swe.f = estimering(Swe.T1.(vois{1}), Swe.T1.(vois{2}), Swe.T1.(vois{3}), ...
                    Swe.T1.(vois{2})./Swe.T1.(vois{3}));
Swe.g = estimering(newData.Sweden.(vois{1}), newData.Sweden.(vois{2}),...
                            newData.Sweden.(vois{3}), newData.Sweden.(vois{2})...
                            .*newData.Sweden.(vois{2}).*newData.Sweden.(vois{2}));

                              
Swe.functions.a = functionFinder(Swe.a.betas, newData.Sweden.(vois{2}));
Swe.functions.b = functionFinder(Swe.b.betas, newData.Sweden.(vois{2}),newData.Sweden.(vois{3}));
Swe.functions.c = functionFinder(Swe.c.betas, Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}));
Swe.functions.d = functionFinder(Swe.d.betas, Swe.T1.(vois{2}),Swe.T1.(vois{3}));
Swe.functions.e = functionFinder(Swe.e.betas, Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}), ...
                                 Swe.T4pluss.(vois{2})./Swe.T4pluss.(vois{3}));
Swe.functions.f = functionFinder(Swe.f.betas, Swe.T1.(vois{2}), Swe.T1.(vois{3}), ...
                                 Swe.T1.(vois{2})./Swe.T1.(vois{3}));


Swe.r2.a = calcR2(newData.Sweden.(vois{2}), Swe.a.betas, newData.Sweden.(vois{1}));

Swe.r2.b = calcR2([newData.Sweden.(vois{2}), newData.Sweden.(vois{3})],...
                Swe.b.betas, newData.Sweden.(vois{1}));
            
Swe.r2.c = calcR2([Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3})], ...
                     Swe.c.betas, Swe.T4pluss.(vois{1}));
                 
Swe.r2.d = calcR2([Swe.T1.(vois{2}),Swe.T1.(vois{3})], ...
                      Swe.d.betas, Swe.T4pluss.(vois{1}));
                 
Swe.r2.e = calcR2([Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}), ...
                    Swe.T4pluss.(vois{2})./Swe.T4pluss.(vois{3})], ... 
                    Swe.e.betas, Swe.T4pluss.(vois{1}));

Swe.r2.f = calcR2([Swe.T1.(vois{2}), Swe.T1.(vois{3}), ...
                    Swe.T1.(vois{2})./Swe.T1.(vois{3})], ...
                    Swe.f.betas, Swe.T1.(vois{1}));
                

% r2: the closer to 1,  the better. The closer to 0, the worse

Swe.stats = stats(voi,vois);
Swe.T4pluss.stats = stats(T4voi,vois);
Swe.T1.stats = stats(T1voi,vois);

%res = createPlots(Swe.functions.b, data.Sweden.title)
createPlots(Swe.functions.b,[newData.Sweden.(vois{1}), newData.Sweden.(vois{2}),...
            newData.Sweden.(vois{3})], data.Sweden.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};


createPlots(Swe.functions.c, [Swe.T4pluss.(vois{1}), Swe.T4pluss.(vois{2}),...
                            Swe.T4pluss.(vois{3})], [data.Sweden.title, ' T4'], vis)

createPlots(Swe.functions.e, [Swe.T1.(vois{1}), Swe.T1.(vois{2}), Swe.T1.(vois{3}), ...
                    Swe.T1.(vois{2})./Swe.T1.(vois{3})], [data.Sweden.title, ' T1'], vis)

createPlots(Swe.functions.f, [Swe.T4pluss.(vois{1}), Swe.T4pluss.(vois{2}), Swe.T4pluss.(vois{3}), ...
                    Swe.T4pluss.(vois{2})./Swe.T4pluss.(vois{3})], [data.Sweden.title, ' T4'], vis)
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
                
Swe.TeaCert = struct;            
[Swe.TeaCert.TeacherCert, Swe.TeaCert.TeacherCert.HR, Swe.TeaCert.TeacherCert.n] = ...
                                                    sortInfo ( newData.Sweden.teacher_cert, voi, vois, 1);
[Swe.TeaCert.TeacherNotCert, Swe.TeaCert.TeacherNotCert.HR, Swe.TeaCert.TeacherNotCert.n] = ...
                                                    sortInfo ( newData.Sweden.teacher_cert, voi, vois, 0);

TCvoi = {Swe.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(1)}), Swe.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Swe.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(3)})};
TNCvoi = {Swe.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(1)}), Swe.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Swe.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(3)})};

                  
Swe.TeaCert.a = estimering(newData.Sweden.(vois{1}), newData.Sweden.(vois{2})); 

Swe.TeaCert.b = estimering(newData.Sweden.(vois{1}), newData.Sweden.(vois{2}), newData.Sweden.(vois{3}));
                       
Swe.TeaCert.c = estimering(Swe.TeaCert.TeacherCert.(vois{1}), Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}));

Swe.TeaCert.d = estimering(Swe.TeaCert.TeacherNotCert.(vois{1}), Swe.TeaCert.TeacherNotCert.(vois{2}),Swe.TeaCert.TeacherNotCert.(vois{3}));

Swe.TeaCert.e = estimering(Swe.TeaCert.TeacherCert.(vois{1}), Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}), ...
                    Swe.TeaCert.TeacherCert.(vois{2})./Swe.TeaCert.TeacherCert.(vois{3}));

Swe.TeaCert.f = estimering(Swe.TeaCert.TeacherNotCert.(vois{1}), Swe.TeaCert.TeacherNotCert.(vois{2}), Swe.TeaCert.TeacherNotCert.(vois{3}), ...
                    Swe.TeaCert.TeacherNotCert.(vois{2})./Swe.TeaCert.TeacherNotCert.(vois{3}));
                              
Swe.TeaCert.functions.a = functionFinder(Swe.TeaCert.a.betas, newData.Sweden.(vois{2}));
Swe.TeaCert.functions.b = functionFinder(Swe.TeaCert.b.betas, newData.Sweden.(vois{2}),newData.Sweden.(vois{3}));
Swe.TeaCert.functions.c = functionFinder(Swe.TeaCert.c.betas, Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}));
Swe.TeaCert.functions.d = functionFinder(Swe.TeaCert.d.betas, Swe.TeaCert.TeacherNotCert.(vois{2}),Swe.TeaCert.TeacherNotCert.(vois{3}));
Swe.TeaCert.functions.e = functionFinder(Swe.TeaCert.e.betas, Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}), ...
                                 Swe.TeaCert.TeacherCert.(vois{2})./Swe.TeaCert.TeacherCert.(vois{3}));
Swe.TeaCert.functions.f = functionFinder(Swe.TeaCert.TeacherNotCert.(vois{2}), Swe.TeaCert.TeacherNotCert.(vois{3}), ...
                                 Swe.TeaCert.TeacherNotCert.(vois{2})./Swe.TeaCert.TeacherNotCert.(vois{3}));

Swe.TeaCert.r2.a = calcR2(newData.Sweden.(vois{2}), Swe.TeaCert.a.betas, newData.Sweden.(vois{1}));

Swe.TeaCert.r2.b = calcR2([newData.Sweden.(vois{2}), newData.Sweden.(vois{3})],...
                Swe.TeaCert.b.betas, newData.Sweden.(vois{1}));
            
Swe.TeaCert.r2.c = calcR2([Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3})], ...
                     Swe.TeaCert.c.betas, Swe.TeaCert.TeacherCert.(vois{1}));
                 
Swe.TeaCert.r2.d = calcR2([Swe.TeaCert.TeacherNotCert.(vois{2}),Swe.TeaCert.TeacherNotCert.(vois{3})], ...
                      Swe.TeaCert.d.betas, Swe.TeaCert.TeacherCert.(vois{1}));
                 
Swe.TeaCert.r2.e = calcR2([Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}), ...
                    Swe.TeaCert.TeacherCert.(vois{2})./Swe.TeaCert.TeacherCert.(vois{3})], ... 
                    Swe.TeaCert.e.betas, Swe.TeaCert.TeacherCert.(vois{1}));

Swe.TeaCert.r2.f = calcR2([Swe.TeaCert.TeacherNotCert.(vois{2}), Swe.TeaCert.TeacherNotCert.(vois{3}), ...
                    Swe.TeaCert.TeacherNotCert.(vois{2})./Swe.TeaCert.TeacherNotCert.(vois{3})], ...
                    Swe.TeaCert.f.betas, Swe.TeaCert.TeacherNotCert.(vois{1}));

% r2: the closer to 1,  the better. The closer to 0, the worse

Swe.TeaCert.stats = stats(voi,vois);
Swe.TeaCert.TeacherCert.stats = stats(TCvoi,vois);
Swe.TeaCert.TeacherNotCert.stats = stats(TNCvoi,vois);

%res = createPlots(Swe.TeaCert.functions.b, data.Sweden.title)
createPlots(Swe.TeaCert.functions.b,[newData.Sweden.(vois{1}), newData.Sweden.(vois{2}),...
            newData.Sweden.(vois{3})], data.Sweden.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};


createPlots(Swe.TeaCert.functions.c, [Swe.TeaCert.TeacherCert.(vois{1}), Swe.TeaCert.TeacherCert.(vois{2}),...
                            Swe.TeaCert.TeacherCert.(vois{3})], [data.Sweden.title ' Teacher Certified'] , vis)

createPlots(Swe.TeaCert.functions.e, [Swe.TeaCert.TeacherNotCert.(vois{1}), Swe.TeaCert.TeacherNotCert.(vois{2}), Swe.TeaCert.TeacherNotCert.(vois{3}), ...
                    Swe.TeaCert.TeacherNotCert.(vois{2})./Swe.TeaCert.TeacherNotCert.(vois{3})], [data.Sweden.title ' Teacher Not Certified'], vis)

createPlots(Swe.TeaCert.functions.f, [Swe.TeaCert.TeacherCert.(vois{1}), Swe.TeaCert.TeacherCert.(vois{2}), Swe.TeaCert.TeacherCert.(vois{3}), ...
                    Swe.TeaCert.TeacherCert.(vois{2})./Swe.TeaCert.TeacherCert.(vois{3})], [data.Sweden.title ' Teacher Certified'], vis)    
% Hypotesetester
% hvis h = 0, forkastes ikke null-hypotesen                
[h0] = TwoVarTest(Swe.TeaCert.TeacherCert.read, Swe.TeaCert.TeacherNotCert.read,  Swe.TeaCert.TeacherCert.n, ...
                Swe.TeaCert.TeacherNotCert.n, 0.10, 0)  
[h0] = TwoVarTestMAD(Swe.TeaCert.TeacherCert.read, Swe.TeaCert.TeacherNotCert.read,  Swe.TeaCert.TeacherCert.n, ...
                Swe.TeaCert.TeacherNotCert.n, 0.10, 0) 
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
USA = struct; USA.to = struct; USA.tre = struct;
variblesOfInterest = {newData.USA.(allVaribles{posisjonOfVOIS(1)}), newData.USA.(allVaribles{posisjonOfVOIS(2)}), ...
                      newData.USA.(allVaribles{posisjonOfVOIS(3)})};
voi = variblesOfInterest; %just shorter

[USA.T4pluss, USA.T4pluss.HR, ~] = sortInfo ( newData.USA.sameteacher4_plus, voi, vois, 1);
[USA.T1, USA.T1.HR, ~] = sortInfo ( newData.USA.sameteacher1_less, voi, vois, 1);


T4voi = {USA.T4pluss.(allVaribles{posisjonOfVOIS(1)}), USA.T4pluss.(allVaribles{posisjonOfVOIS(2)}), ...
                      USA.T4pluss.(allVaribles{posisjonOfVOIS(3)})};
T1voi = {USA.T1.(allVaribles{posisjonOfVOIS(1)}), USA.T1.(allVaribles{posisjonOfVOIS(2)}), ...
                      USA.T1.(allVaribles{posisjonOfVOIS(3)})};


USA.a = estimering(newData.USA.(vois{1}), newData.USA.(vois{2})); 

USA.b = estimering(newData.USA.(vois{1}), newData.USA.(vois{2}), newData.USA.(vois{3}));
                       
USA.c = estimering(USA.T4pluss.(vois{1}), USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}));

USA.d = estimering(USA.T1.(vois{1}), USA.T1.(vois{2}),USA.T1.(vois{3}));

USA.e = estimering(USA.T4pluss.(vois{1}), USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}), ...
                    USA.T4pluss.(vois{2})./USA.T4pluss.(vois{3}));

USA.f = estimering(USA.T1.(vois{1}), USA.T1.(vois{2}), USA.T1.(vois{3}), ...
                    USA.T1.(vois{2})./USA.T1.(vois{3}));
USA.g = estimering(newData.USA.(vois{1}), newData.USA.(vois{2}),...
                            newData.USA.(vois{3}), newData.USA.(vois{2})...
                            .*newData.USA.(vois{2}).*newData.USA.(vois{2}));

                              
USA.functions.a = functionFinder(USA.a.betas, newData.USA.(vois{2}));
USA.functions.b = functionFinder(USA.b.betas, newData.USA.(vois{2}),newData.USA.(vois{3}));
USA.functions.c = functionFinder(USA.c.betas, USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}));
USA.functions.d = functionFinder(USA.d.betas, USA.T1.(vois{2}),USA.T1.(vois{3}));
USA.functions.e = functionFinder(USA.e.betas, USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}), ...
                                 USA.T4pluss.(vois{2})./USA.T4pluss.(vois{3}));
USA.functions.f = functionFinder(USA.f.betas, USA.T1.(vois{2}), USA.T1.(vois{3}), ...
                                 USA.T1.(vois{2})./USA.T1.(vois{3}));


USA.r2.a = calcR2(newData.USA.(vois{2}), USA.a.betas, newData.USA.(vois{1}));

USA.r2.b = calcR2([newData.USA.(vois{2}), newData.USA.(vois{3})],...
                USA.b.betas, newData.USA.(vois{1}));
            
USA.r2.c = calcR2([USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3})], ...
                     USA.c.betas, USA.T4pluss.(vois{1}));
                 
USA.r2.d = calcR2([USA.T1.(vois{2}),USA.T1.(vois{3})], ...
                      USA.d.betas, USA.T4pluss.(vois{1}));
                 
USA.r2.e = calcR2([USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}), ...
                    USA.T4pluss.(vois{2})./USA.T4pluss.(vois{3})], ... 
                    USA.e.betas, USA.T4pluss.(vois{1}));

USA.r2.f = calcR2([USA.T1.(vois{2}), USA.T1.(vois{3}), ...
                    USA.T1.(vois{2})./USA.T1.(vois{3})], ...
                    USA.f.betas, USA.T1.(vois{1}));
                

% r2: the closer to 1,  the better. The closer to 0, the worse

USA.stats = stats(voi,vois);
USA.T4pluss.stats = stats(T4voi,vois);
USA.T1.stats = stats(T1voi,vois);

%res = createPlots(USA.functions.b, data.USA.title)
createPlots(USA.functions.b,[newData.USA.(vois{1}), newData.USA.(vois{2}),...
            newData.USA.(vois{3})], data.USA.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};


createPlots(USA.functions.c, [USA.T4pluss.(vois{1}), USA.T4pluss.(vois{2}),...
                            USA.T4pluss.(vois{3})], [data.USA.title, ' T4'], vis)

createPlots(USA.functions.e, [USA.T1.(vois{1}), USA.T1.(vois{2}), USA.T1.(vois{3}), ...
                    USA.T1.(vois{2})./USA.T1.(vois{3})], [data.USA.title, ' T1'], vis)

createPlots(USA.functions.f, [USA.T4pluss.(vois{1}), USA.T4pluss.(vois{2}), USA.T4pluss.(vois{3}), ...
                    USA.T4pluss.(vois{2})./USA.T4pluss.(vois{3})], [data.USA.title, ' T4'], vis)
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
                
USA.TeaCert = struct;            
[USA.TeaCert.TeacherCert, USA.TeaCert.TeacherCert.HR, USA.TeaCert.TeacherCert.n] = ...
                                                    sortInfo ( newData.USA.teacher_cert, voi, vois, 1);
[USA.TeaCert.TeacherNotCert, USA.TeaCert.TeacherNotCert.HR, USA.TeaCert.TeacherNotCert.n] = ...
                                                    sortInfo ( newData.USA.teacher_cert, voi, vois, 0);

TCvoi = {USA.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(1)}), USA.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      USA.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(3)})};
TNCvoi = {USA.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(1)}), USA.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      USA.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(3)})};

                  
USA.TeaCert.a = estimering(newData.USA.(vois{1}), newData.USA.(vois{2})); 

USA.TeaCert.b = estimering(newData.USA.(vois{1}), newData.USA.(vois{2}), newData.USA.(vois{3}));
                       
USA.TeaCert.c = estimering(USA.TeaCert.TeacherCert.(vois{1}), USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}));

USA.TeaCert.d = estimering(USA.TeaCert.TeacherNotCert.(vois{1}), USA.TeaCert.TeacherNotCert.(vois{2}),USA.TeaCert.TeacherNotCert.(vois{3}));

USA.TeaCert.e = estimering(USA.TeaCert.TeacherCert.(vois{1}), USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}), ...
                    USA.TeaCert.TeacherCert.(vois{2})./USA.TeaCert.TeacherCert.(vois{3}));

USA.TeaCert.f = estimering(USA.TeaCert.TeacherNotCert.(vois{1}), USA.TeaCert.TeacherNotCert.(vois{2}), USA.TeaCert.TeacherNotCert.(vois{3}), ...
                    USA.TeaCert.TeacherNotCert.(vois{2})./USA.TeaCert.TeacherNotCert.(vois{3}));
                              
USA.TeaCert.functions.a = functionFinder(USA.TeaCert.a.betas, newData.USA.(vois{2}));
USA.TeaCert.functions.b = functionFinder(USA.TeaCert.b.betas, newData.USA.(vois{2}),newData.USA.(vois{3}));
USA.TeaCert.functions.c = functionFinder(USA.TeaCert.c.betas, USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}));
USA.TeaCert.functions.d = functionFinder(USA.TeaCert.d.betas, USA.TeaCert.TeacherNotCert.(vois{2}),USA.TeaCert.TeacherNotCert.(vois{3}));
USA.TeaCert.functions.e = functionFinder(USA.TeaCert.e.betas, USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}), ...
                                 USA.TeaCert.TeacherCert.(vois{2})./USA.TeaCert.TeacherCert.(vois{3}));
USA.TeaCert.functions.f = functionFinder(USA.TeaCert.TeacherNotCert.(vois{2}), USA.TeaCert.TeacherNotCert.(vois{3}), ...
                                 USA.TeaCert.TeacherNotCert.(vois{2})./USA.TeaCert.TeacherNotCert.(vois{3}));

USA.TeaCert.r2.a = calcR2(newData.USA.(vois{2}), USA.TeaCert.a.betas, newData.USA.(vois{1}));

USA.TeaCert.r2.b = calcR2([newData.USA.(vois{2}), newData.USA.(vois{3})],...
                USA.TeaCert.b.betas, newData.USA.(vois{1}));
            
USA.TeaCert.r2.c = calcR2([USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3})], ...
                     USA.TeaCert.c.betas, USA.TeaCert.TeacherCert.(vois{1}));
                 
USA.TeaCert.r2.d = calcR2([USA.TeaCert.TeacherNotCert.(vois{2}),USA.TeaCert.TeacherNotCert.(vois{3})], ...
                      USA.TeaCert.d.betas, USA.TeaCert.TeacherCert.(vois{1}));
                 
USA.TeaCert.r2.e = calcR2([USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}), ...
                    USA.TeaCert.TeacherCert.(vois{2})./USA.TeaCert.TeacherCert.(vois{3})], ... 
                    USA.TeaCert.e.betas, USA.TeaCert.TeacherCert.(vois{1}));

USA.TeaCert.r2.f = calcR2([USA.TeaCert.TeacherNotCert.(vois{2}), USA.TeaCert.TeacherNotCert.(vois{3}), ...
                    USA.TeaCert.TeacherNotCert.(vois{2})./USA.TeaCert.TeacherNotCert.(vois{3})], ...
                    USA.TeaCert.f.betas, USA.TeaCert.TeacherNotCert.(vois{1}));

% r2: the closer to 1,  the better. The closer to 0, the worse

USA.TeaCert.stats = stats(voi,vois);
USA.TeaCert.TeacherCert.stats = stats(TCvoi,vois);
USA.TeaCert.TeacherNotCert.stats = stats(TNCvoi,vois);

%res = createPlots(USA.TeaCert.functions.b, data.USA.title)
createPlots(USA.TeaCert.functions.b,[newData.USA.(vois{1}), newData.USA.(vois{2}),...
            newData.USA.(vois{3})], data.USA.title, vois)
vis = {'read', 'teacher_exp', 'clsize', 'teacher_exp/clsize'};


createPlots(USA.TeaCert.functions.c, [USA.TeaCert.TeacherCert.(vois{1}), USA.TeaCert.TeacherCert.(vois{2}),...
                            USA.TeaCert.TeacherCert.(vois{3})], [data.USA.title ' Teacher Certified'] , vis)

createPlots(USA.TeaCert.functions.e, [USA.TeaCert.TeacherNotCert.(vois{1}), USA.TeaCert.TeacherNotCert.(vois{2}), USA.TeaCert.TeacherNotCert.(vois{3}), ...
                    USA.TeaCert.TeacherNotCert.(vois{2})./USA.TeaCert.TeacherNotCert.(vois{3})], [data.USA.title ' Teacher Not Certified'], vis)

createPlots(USA.TeaCert.functions.f, [USA.TeaCert.TeacherCert.(vois{1}), USA.TeaCert.TeacherCert.(vois{2}), USA.TeaCert.TeacherCert.(vois{3}), ...
                    USA.TeaCert.TeacherCert.(vois{2})./USA.TeaCert.TeacherCert.(vois{3})], [data.USA.title ' Teacher Certified'], vis)    
% Hypotesetester
% hvis h = 0, forkastes ikke null-hypotesen                
[h0] = TwoVarTest(USA.TeaCert.TeacherCert.read, USA.TeaCert.TeacherNotCert.read,  USA.TeaCert.TeacherCert.n, ...
                USA.TeaCert.TeacherNotCert.n, 0.10, 0)  
[h0] = TwoVarTestMAD(USA.TeaCert.TeacherCert.read, USA.TeaCert.TeacherNotCert.read,  USA.TeaCert.TeacherCert.n, ...
                USA.TeaCert.TeacherNotCert.n, 0.10, 0) 
            
            