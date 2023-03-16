% Simulated Annealing 
tic
clear all;
clc;

LB=[4.08e-6 4.08e-6 4.08e-6 4.08e-6 4.08e-6 4e-9 0.9e-12];      % lower bounds of variables
UB=[5.04e-6 5.04e-6 5.04e-6 5.04e-6 5.04e-6 4.8e-9 1.1e-12];    % upper bounds of variables
Best=[4.56e-6 4.90e-6 4.08e-6 4.08e-6 4.08e-6 4e-9 9e-13];
m=7;


for j=1:m
    
       x(j)= rand()*LB(j)+rand()*(UB(j)-LB(j));%Initial position
       %x(j)=Best(j);
       x(j)=min(UB(j),(abs(x(j))));  
       x(j)=max(LB(j),(abs(x(j))));
       
end

%initiallizing
%T_i = 100000; %initial Temp
%T_f = 1e-100; %final Temp
%K=1;
%alpha=0.95;
    
T_i = 10000; %initial Temp
T_f = 1e-100; %final Temp
K=1;
alpha=0.95;

N=50;%no of iteration

%initializing the various values
T= T_i;
E_i_0= simulate(x);
E_i= E_i_0(41,2);
E_old= E_i;
E_new=E_old;
best = x; 
%initializing counters
i=0; 
while((T> T_f) && i<N)
    
         %function caluations at new locations
         
        ns=abs(repmat(LB,1,1)+repmat((UB-LB),1,1).*rand(1,m));
      
        ns=min(UB,(abs(ns)));  
        ns=max(LB,(abs(ns)));
       
        E_new_0= simulate(ns);
        E_new= E_new_0(41,2);
         
        DeltaE=E_new-E_old;%calculation of change in energy function
        
  
          if (DeltaE>0)
              best= ns;
              E_old=E_new;
              
          else
               p=exp(DeltaE/K*T);%defining the probability function
               
              if(p>rand)
               best= ns;
               E_old=E_new;
              end
              
          end
          
              T=T*(alpha);
              i=i+1;
              f_optimum=E_old;
              
 fprintf(" for %d iteration, estimated value is %f\n",i,f_optimum);  
 suri(i)=f_optimum;

end
disp(best);
disp(f_optimum);
plot(suri);
toc