clear all; close all; clc;

%Number of Proteins in the time domain
[t1,y1] = ode45(@gene_reg,[0 500],[0 0]); %(function call, time interval, initial conditions)

figure(1);
plot(t1,y1(:,1), 'g')
hold on
plot(t1,y1(:,2), 'b')

title('Concentration of Protein vs Time');
xlabel('Time');
ylabel('Concentration of Protein (moles)');
legend('X','Y');
hold off

%trajectory of state (Number of proteins)
% shows concentration of X acts as a "switch" for initiating the transcription and translation of
% the gene/mRNA related to protein Y when the concentration of X is approx 0.5 moles
figure(2);
plot(y1(:,1), y1(:,2), 'r')

title('State trajectory using ODE45');
xlabel('Concentration of X (moles)')
ylabel('Concentration of Y (moles)');



