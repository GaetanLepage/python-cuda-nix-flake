{
  pkgs ? import <nixpkgs> {
    config = {
      cudaSupport = true;
      allowUnfree = true;
    };
  },
}:
pkgs.mkShell {
  packages = [
    pkgs.openmpi
    pkgs.libyaml
    pkgs.gcc

    # for jupyter notebook (basics, for more advanced use jupyenv)
    (pkgs.python312.withPackages (pp: [
      pp.dask
      pp.distributed
      pp.numpy

      pp.numba

      pp.ray
      pp.cupy

      pp.jax
      pp.mpi4py
      pp.torch-bin

      # for jupyter notebook (basics, for more advanced use jupyenv)
      pp.ipython
      pp.jupyter

      pp.pillow
      pp.tqdm
      pp.ipywidgets
      pp.imageio
      pp.matplotlib
    ]))
  ];
}
