conda env update -n wgpu
source activate base
conda activate wgpu
emsdk update
emsdk install $EMSCRIPTEN_VERSION
emsdk activate $EMSCRIPTEN_VERSION
CONDA_PREFIX=$(conda info --base)/envs/wgpu
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo "#!/bin/sh" > $CONDA_PREFIX/etc/conda/activate.d/emscripten.sh
echo "source $(python -c 'import site; print(site.getsitepackages()[0])')/emsdk/emsdk_env.sh" >> $CONDA_PREFIX/etc/conda/activate.d/emscripten.sh
