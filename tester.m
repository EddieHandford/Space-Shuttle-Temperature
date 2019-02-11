i=0; 
nx = 21; 
thick = 0.05; 
tmax = 4000; 
for nt = 41:20:1001 
    i=i+1; 
    dt(i) = tmax/(nt-1); 
    disp (['nt = ' num2str(nt) ', dt = ' num2str(dt(i)) ' s']) 
    
    [~, ~, u] = shuttle(tmax, nt, thick, nx, 'forward', false); 
    ua(i) = u(end, 1); 
   [~, ~, u] = shuttle(tmax, nt, thick, nx, 'backward', false); 
    ub(i) = u(end, 1); 
  [~, ~, u] = shuttle(tmax, nt, thick, nx, 'dufort', false); 
    uc(i) = u(end, 1); 
  [~, ~, u] = shuttle(tmax, nt, thick, nx, 'crank-nicolson', false); 
    ud(i) = u(end, 1); 

end 
figure (3) 
plot(dt, [ ua; ub; uc; ud]) 
ylim([100 200]) 
legend ('Forward', 'Backward', 'Dufort', 'Crank-nicolson')
title ('Comparison of Step size against stability of various Methods')
xlabel ('Timestep size')
ylabel ('Temperature Fahrenheit')