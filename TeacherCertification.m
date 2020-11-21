Nor.TeaCert = struct;            
[Nor.TeaCert.TeacherCert, Nor.TeaCert.TeacherCert.HR, Nor.TeaCert.TeacherCert.n] = ...
                                                    sortInfo ( newData.Norway.teacher_cert, voi, vois, 1);
[Nor.TeaCert.TeacherNotCert, Nor.TeaCert.TeacherNotCert.HR, Nor.TeaCert.TeacherNotCert.n] = ...
                                                    sortInfo ( newData.Norway.teacher_cert, voi, vois, 0);

TCvoi = {Nor.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(1)}), Nor.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Nor.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(3)})};
TNCvoi = {Nor.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(1)}), Nor.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Nor.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(3)})};

                  
Nor.TeaCert.a = estimering(newData.Norway.(vois{1}), newData.Norway.(vois{2})); 

Nor.TeaCert.b = estimering(newData.Norway.(vois{1}), newData.Norway.(vois{2}), newData.Norway.(vois{3}));
                       
Nor.TeaCert.c = estimering(Nor.TeaCert.TeacherCert.(vois{1}), Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3}));

Nor.TeaCert.d = estimering(Nor.TeaCert.TeacherNotCert.(vois{1}), Nor.TeaCert.TeacherNotCert.(vois{2}),Nor.TeaCert.TeacherNotCert.(vois{3}));

Nor.TeaCert.e = estimering(Nor.TeaCert.TeacherCert.(vois{1}), Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3}), ...
                    Nor.TeaCert.TeacherCert.(vois{2})./Nor.TeaCert.TeacherCert.(vois{3}));

Nor.TeaCert.f = estimering(Nor.TeaCert.TeacherNotCert.(vois{1}), Nor.TeaCert.TeacherNotCert.(vois{2}), Nor.TeaCert.TeacherNotCert.(vois{3}), ...
                    Nor.TeaCert.TeacherNotCert.(vois{2})./Nor.TeaCert.TeacherNotCert.(vois{3}));
                              
Nor.TeaCert.functions.a = functionFinder(Nor.TeaCert.a.betas, newData.Norway.(vois{2}));
Nor.TeaCert.functions.b = functionFinder(Nor.TeaCert.b.betas, newData.Norway.(vois{2}),newData.Norway.(vois{3}));
Nor.TeaCert.functions.c = functionFinder(Nor.TeaCert.c.betas, Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3}));
Nor.TeaCert.functions.d = functionFinder(Nor.TeaCert.d.betas, Nor.TeaCert.TeacherNotCert.(vois{2}),Nor.TeaCert.TeacherNotCert.(vois{3}));
Nor.TeaCert.functions.e = functionFinder(Nor.TeaCert.e.betas, Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3}), ...
                                 Nor.TeaCert.TeacherCert.(vois{2})./Nor.TeaCert.TeacherCert.(vois{3}));
Nor.TeaCert.functions.f = functionFinder(Nor.TeaCert.TeacherNotCert.(vois{2}), Nor.TeaCert.TeacherNotCert.(vois{3}), ...
                                 Nor.TeaCert.TeacherNotCert.(vois{2})./Nor.TeaCert.TeacherNotCert.(vois{3}));

Nor.TeaCert.r2.a = calcR2(newData.Norway.(vois{2}), Nor.TeaCert.a.betas, newData.Norway.(vois{1}));

Nor.TeaCert.r2.b = calcR2([newData.Norway.(vois{2}), newData.Norway.(vois{3})],...
                Nor.TeaCert.b.betas, newData.Norway.(vois{1}));
            
Nor.TeaCert.r2.c = calcR2([Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3})], ...
                     Nor.TeaCert.c.betas, Nor.TeaCert.TeacherCert.(vois{1}));
                 
Nor.TeaCert.r2.d = calcR2([Nor.TeaCert.TeacherNotCert.(vois{2}),Nor.TeaCert.TeacherNotCert.(vois{3})], ...
                      Nor.TeaCert.d.betas, Nor.TeaCert.TeacherCert.(vois{1}));
                 
Nor.TeaCert.r2.e = calcR2([Nor.TeaCert.TeacherCert.(vois{2}), Nor.TeaCert.TeacherCert.(vois{3}), ...
                    Nor.TeaCert.TeacherCert.(vois{2})./Nor.TeaCert.TeacherCert.(vois{3})], ... 
                    Nor.TeaCert.e.betas, Nor.TeaCert.TeacherCert.(vois{1}));

Nor.TeaCert.r2.f = calcR2([Nor.TeaCert.TeacherNotCert.(vois{2}), Nor.TeaCert.TeacherNotCert.(vois{3}), ...
                    Nor.TeaCert.TeacherNotCert.(vois{2})./Nor.TeaCert.TeacherNotCert.(vois{3})], ...
                    Nor.TeaCert.f.betas, Nor.TeaCert.TeacherNotCert.(vois{1}));

% r2: the closer to 1,  the better. The closer to 0, the worse

Nor.TeaCert.stats = stats(voi,vois);
Nor.TeaCert.TeacherCert.stats = stats(TCvoi,vois);
Nor.TeaCert.TeacherNotCert.stats = stats(TNCvoi,vois);


%%%%%%%%%%%%%%%%%%%%%


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



%%%%%%%%%%%%%%%%%%%%%%%%%%5



Ger.TeaCert = struct;            
[Ger.TeaCert.TeacherCert, Ger.TeaCert.TeacherCert.HR, Ger.TeaCert.TeacherCert.n] = ...
                                                    sortInfo ( newData.Germany.teacher_cert, voi, vois, 1);
[Ger.TeaCert.TeacherNotCert, Ger.TeaCert.TeacherNotCert.HR, Ger.TeaCert.TeacherNotCert.n] = ...
                                                    sortInfo ( newData.Germany.teacher_cert, voi, vois, 0);

TCvoi = {Ger.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(1)}), Ger.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Ger.TeaCert.TeacherCert.(allVaribles{posisjonOfVOIS(3)})};
TNCvoi = {Ger.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(1)}), Ger.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(2)}), ...
                      Ger.TeaCert.TeacherNotCert.(allVaribles{posisjonOfVOIS(3)})};

                  
Ger.TeaCert.a = estimering(newData.Germany.(vois{1}), newData.Germany.(vois{2})); 

Ger.TeaCert.b = estimering(newData.Germany.(vois{1}), newData.Germany.(vois{2}), newData.Germany.(vois{3}));
                       
Ger.TeaCert.c = estimering(Ger.TeaCert.TeacherCert.(vois{1}), Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3}));

Ger.TeaCert.d = estimering(Ger.TeaCert.TeacherNotCert.(vois{1}), Ger.TeaCert.TeacherNotCert.(vois{2}),Ger.TeaCert.TeacherNotCert.(vois{3}));

Ger.TeaCert.e = estimering(Ger.TeaCert.TeacherCert.(vois{1}), Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3}), ...
                    Ger.TeaCert.TeacherCert.(vois{2})./Ger.TeaCert.TeacherCert.(vois{3}));

Ger.TeaCert.f = estimering(Ger.TeaCert.TeacherNotCert.(vois{1}), Ger.TeaCert.TeacherNotCert.(vois{2}), Ger.TeaCert.TeacherNotCert.(vois{3}), ...
                    Ger.TeaCert.TeacherNotCert.(vois{2})./Ger.TeaCert.TeacherNotCert.(vois{3}));
                              
Ger.TeaCert.functions.a = functionFinder(Ger.TeaCert.a.betas, newData.Germany.(vois{2}));
Ger.TeaCert.functions.b = functionFinder(Ger.TeaCert.b.betas, newData.Germany.(vois{2}),newData.Germany.(vois{3}));
Ger.TeaCert.functions.c = functionFinder(Ger.TeaCert.c.betas, Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3}));
Ger.TeaCert.functions.d = functionFinder(Ger.TeaCert.d.betas, Ger.TeaCert.TeacherNotCert.(vois{2}),Ger.TeaCert.TeacherNotCert.(vois{3}));
Ger.TeaCert.functions.e = functionFinder(Ger.TeaCert.e.betas, Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3}), ...
                                 Ger.TeaCert.TeacherCert.(vois{2})./Ger.TeaCert.TeacherCert.(vois{3}));
Ger.TeaCert.functions.f = functionFinder(Ger.TeaCert.TeacherNotCert.(vois{2}), Ger.TeaCert.TeacherNotCert.(vois{3}), ...
                                 Ger.TeaCert.TeacherNotCert.(vois{2})./Ger.TeaCert.TeacherNotCert.(vois{3}));

Ger.TeaCert.r2.a = calcR2(newData.Germany.(vois{2}), Ger.TeaCert.a.betas, newData.Germany.(vois{1}));

Ger.TeaCert.r2.b = calcR2([newData.Germany.(vois{2}), newData.Germany.(vois{3})],...
                Ger.TeaCert.b.betas, newData.Germany.(vois{1}));
            
Ger.TeaCert.r2.c = calcR2([Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3})], ...
                     Ger.TeaCert.c.betas, Ger.TeaCert.TeacherCert.(vois{1}));
                 
Ger.TeaCert.r2.d = calcR2([Ger.TeaCert.TeacherNotCert.(vois{2}),Ger.TeaCert.TeacherNotCert.(vois{3})], ...
                      Ger.TeaCert.d.betas, Ger.TeaCert.TeacherCert.(vois{1}));
                 
Ger.TeaCert.r2.e = calcR2([Ger.TeaCert.TeacherCert.(vois{2}), Ger.TeaCert.TeacherCert.(vois{3}), ...
                    Ger.TeaCert.TeacherCert.(vois{2})./Ger.TeaCert.TeacherCert.(vois{3})], ... 
                    Ger.TeaCert.e.betas, Ger.TeaCert.TeacherCert.(vois{1}));

Ger.TeaCert.r2.f = calcR2([Ger.TeaCert.TeacherNotCert.(vois{2}), Ger.TeaCert.TeacherNotCert.(vois{3}), ...
                    Ger.TeaCert.TeacherNotCert.(vois{2})./Ger.TeaCert.TeacherNotCert.(vois{3})], ...
                    Ger.TeaCert.f.betas, Ger.TeaCert.TeacherNotCert.(vois{1}));

% r2: the closer to 1,  the better. The closer to 0, the worse

Ger.TeaCert.stats = stats(voi,vois);
Ger.TeaCert.TeacherCert.stats = stats(TCvoi,vois);
Ger.TeaCert.TeacherNotCert.stats = stats(TNCvoi,vois);
