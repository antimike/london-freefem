%The ffmatlib library doesn't seem to work out of the box with non-Lagrangian elements.
%TODO: See if Matlab / Octave support Nedelec elements and implement support in ffmatlib
clear all;
addpath('../../matlab/release-v2.0/demos/ffmatlib');

%This only works for medit mesh formats...
%[pts, bdy_tris, tetra, edges, quads, hexahedra, num_pts, num_tetra, num_bdy_tris] = ffreadmesh('empty-space-mesh.mesh');
[pts, bdy_edges, tris, num_pts, num_bdy_edges, num_tris, labels] = ffreadmesh('empty-space-mesh.mesh');
[fespace] = ffreaddata('empty-space-fespace.txt');
[Bx, By, Bz] = ffreaddata('empty-space-magnetic-field.txt');
[Ax, Ay, Az] = ffreaddata('empty-space-vector-potential.txt');

figure;
ffpdeplot3D(pts, bdy_edges, tris, 'VhSeq', fespace, ...
    'FlowData', [Bx, By, Bz]);
ylabel('y');
xlabel('x');
zlabel('z');
