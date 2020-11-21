X1 = linspace(1,45,100); X2 = linspace(45,1,100); 
Y = linspace(5,35,100);
Z1 = X1./Y; Z2 = X2./Y; 

figure;
hold on; grid on;
plot3(X1,Y,Z1)
xlabel('Teacher Experience')
ylabel('Class size')
zlabel('Value')

figure;
hold on; grid on;
plot3(X2,Y,Z2)
xlabel('Teacher Experience')
ylabel('Class size')
zlabel('Value')
