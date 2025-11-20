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
    (pkgs.python312.withPackages (
      pp: with pp; [
        dask
        distributed
        numpy

        numba

        ray
        cupy

        jax
        mpi4py
        torch-bin

        # for jupyter notebook (basics, for more advanced use jupyenv)
        ipython
        jupyter

        pillow
        tqdm
        ipywidgets
        imageio
        matplotlib
      ]
    ))
  ];
}
