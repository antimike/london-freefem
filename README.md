# Solution of the London equations using FreeFEM

## Directory structure

### 2d / 3d
These directories contain the actual FEM variational formulations (i.e., scripts declaring `problem`s and `varf`s).  At this point, most also contain mesh-generation logic; the eventual goal is to migrate all of this to the 'meshes' directory.

### meshes
Contains standalone mesh-generation scripts (i.e., .edp or .idp files that don't declare any `problem`s or `varf`s, whose only purpose is to declare and export mesh objects).  

At the moment, these scripts don't contain any `fespace` declarations either, but given that `fespace` objects can be saved along with the mesh it might make sense to migrate this logic here too.

### macros
Convenience wrappers for common operations in FreeFEM, including vector calc operators Grad, Div, and Curl (for 2d and 3d) and common geometrical parameterization(s) (at the moment only `SquareParameterization` is supported).

#### NOTES ON MACRO USE
Most of the vector-calc macros rely on simple naming conventions to work; e.g., if `A` is the name of a vector field, its components must be named `Ax`, `Ay`, and `Az` for the call `Div3d(A)` to succeed (and in fact `A` does not itself have to be a variable name at all).

Some of the other macros and functions in `vector-analysis.idp`, in particular the macros designed to return unit vectors in various directions, rely on either `r0Internal` or `rho0Internal` being manually set.  This is because the formulas for these unit vectors become singular when `r = 0` or `rho = 0`, and accordingly a "safe-divide" function has been implemented internally which avoids any divide-by-zero SNAFUs.  Rather than choose arbitrary internal cutoff values, however, I've exposed "setters" `setMinR` and `setMinRho` which can be called from client scripts to set the cutoffs.

### matlab
Git submodule for the `ffmatlib` plugin.  The code is also hosted on Github at <https://github.com/samplemaker/freefem_matlab_octave_plot>.

## References
TODO: Add bibliography here
