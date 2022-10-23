function [] = FEABeamPlot(r)


dx = r(1);

if length(r)==2
    dz = r(2);
else
    dz = dx;     %square beam
end



dy = 0.3;    %length of beam in meters

E = 70E9;   %aluminum young modulus
nu = 0.32;  %aluminum poison ratio
YieldS = 95E6;        % aluminum Yield strength
SF = 2;
rho = 2710; % kg/m3


CADBeam(dx,dy,dz)   %creates the stl CAD
smodel = createpde('structural','static-solid');
importGeometry(smodel, 'beam.stl');
figure(1)
pdegplot(smodel,'VertexLabels','on','EdgeLabels','on','CellLabels','on','FaceLabels','on','FaceAlpha',0.5);

h = min(dx,dz)/3;   % About 3 elements along width-height
msh = generateMesh(smodel,'Hmax',h); %Hmax: Target maximum mesh edge length, specified as a positive number.
figure(2)
%%pdeplot3D(smodel,'ElementLabels','on','NodeLabels','on');
pdeplot3D(smodel);


structuralProperties(smodel,'YoungsModulus',E,'PoissonsRatio',nu);  %Pa units
structuralBC(smodel,'Face',5,'Constraint','fixed');       %cantilever attached at face 5

structuralBoundaryLoad(smodel,'Face',6,'SurfaceTraction',[0,0,50/(dx*dz)]);  %Vertex, Edge, Face

Rs = solve(smodel);
figure(3)
pdeplot3D(smodel,'ColorMapData',Rs.VonMisesStress,'Deformation',Rs.Displacement,'DeformationScaleFactor',1);

xi = 1;
Fa = xi*norm(max(Rs.VonMisesStress)-SF*YieldS)^2;
weight = rho*dy*dx*dz;
NormalizedWeight = weight*Fa;
if max(Rs.VonMisesStress)-SF*YieldS > 0
    Fa = Fa*4;
end
Objective = NormalizedWeight + Fa;


end
