clear all; close all; clc;

%Gilespie Algorithm
%1. Initialise the time and concentration of proteins in the system
%2. Update probabilities of next reaction
%3. Generate random number to determine the time interval between previous and next reaction
    %Then update time
%4. Update the concentrations assuming only the reaction with the highest probability occurs
%5. Repeat steps 2-4 until time interval under investigation elapses

%reaction rate constants
k1 = 1;
k2 = 2;
k3 = 0.02;
k4 = 0.04;

%storing concentration of proteins
time = {};
X_set = {};
Y_set = {};

%initialising time and concentration of proteins
t = 0;
T = 200; %maximum elapsed time
X = 0;
Y = 0;

%appending concentration of proteins and time to arrays
time = [time, t];
X_set = [X_set, X];
Y_set = [Y_set, Y];

%Reactions are assumed to be completely random, so if the reaction rate at a time,t, is R_tot 
%then the time,dt, until the next reaction occurs is a random number drawn from exponential
%distribution. Thus, we advance time from t to t+dt

dt = 0.01; %***initialising time until next reaction***

while t < T
    
    %updating rate of reactions
    R1 = k1;
    R2 = k2*X;
    R3 = k3*Y*X^2;
    R4 = k4*X;
    R_tot = R1+R2+R3+R4;

    %updating probability of next reaction
    P1 = R1/R_tot;
    P2 = R2/R_tot;
    P3 = R3/R_tot;
    P4 = R4/R_tot;
    
    %updating time
    t = t+dt;
    
    %updating concentration of proteins
    if (P1>=P2)&&(P1>=P3)&&(P1>=P4)
       X = (X+1);
    elseif (P2>=P1)&&(P2>=P3)&&(P2>=P4)
      X = (X-k2*X); %X = (X-1);
       Y = (Y+k2*X); %Y = (Y+1);
    elseif (P3>=P1)&&(P3>=P2)&&(P3>=P4)
        X = (X+1);
        Y = (Y-1);
    elseif (P4>=P1)&&(P4>=P2)&&(P4>=P3)
        X=(X-1);
    else
        fprintf('problem!')
    end
    
    %randomly sampling time until next reaction
    dt = -log(1-rand)/R_tot;
    
    %appending concentration of proteins and time to arrays
    time = [time, t];
    X_set = [X_set, X];
    Y_set = [Y_set, Y];
end

%plotting
time = cell2mat(time);
X_set = cell2mat(X_set);
Y_set = cell2mat(Y_set);
figure(1);
plot(time, X_set, 'g')
hold on
plot(time, Y_set, 'b')
title('Concentration of Proteins vs Time');
xlabel('Time');
ylabel('Concentration of Proteins (moles)');
legend('X','Y');
hold off

%trajectory of state (Number of proteins)
 figure(2);
 plot(X_set, Y_set, 'r')
 title('State trajectory using Gillespie Algorithm');
 xlabel('Concentration of X (moles)');
 ylabel('Concentration of Y (moles)');