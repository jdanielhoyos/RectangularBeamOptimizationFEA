# RectangularBeamOptimizationFEA
Optimization of a rectangular beam by FEA and Matlab and PSO


It optimizes the weight and try to keep allowable stress of a rectangular beam in cantilever. Uses matlab and Finite Element Analysis FEA.

OptBeam.m

If you want squared beam, uncomment lines 12 13 14.
Width and Height lower and upper limits line 8-9. 
You can increase the number of particles and iterations of the particle swarm optimization in line 7. More iterations and particle, better optimum but it takes longer.

FEABeam.m Line 15, length of the beam in meters. Structural properties and Safety Factor SF lines 17-21.

Load conditions line 40.

We try to minimize weight and keep the allowable stress. Lines 46-53.

Once the optimization ends, it calls FEABeamPlot.m, which is a copy of FEABeam.m but plotting. Take care here, any value you change in FEABeam.m must be done in FEABeamPlot.m to plot the right solution at the end.
