close all
clear all
clc
global counter
counter = 0;
ObjectiveFunction=@FEABeam;
options=optimoptions('particleswarm','SwarmSize',5,'MaxIterations',6);
lb=[0.005 0.005];   %meters
ub=[0.05 0.05];
variables=2;

% lb=[0.005];
% ub=[0.05];
% variables=1;
[r,fval,exitflag,output] = particleswarm(ObjectiveFunction,variables,lb,ub,options)


FEABeamPlot(r)