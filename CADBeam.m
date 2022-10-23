function [] = CADBeam(dx,dy,dz)
    %dy: beam length
    %dx: beam width
    %dz: beam heigh
    %dy = 10;
    %dx = 0.5;
    %dz = 1;
    [n,f] = CreateClosedBeam(dx,dy,dz);     %get nodes and faces of the object
    % % display the polyhedron
    % figure(1); clf;
    % drawPolyhedron(n, f);
    % graphical settings
    % view(3);
    % axis equal;
    %% Compute triangulation
    % Computation of triangulated mesh
    tri = triangulateFaces(f);
    % display new mesh
    % figure(2); clf;
    % patch('vertices', n, 'faces', tri, 'facecolor', 'r');
    % % graphical settings
    % view(3);
    % axis equal;
    fv.faces = tri;
    fv.vertices = n;
    %now hand this to stlwrite
    stlwrite('beam.stl',fv);
end