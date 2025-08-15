conda env update -n wgpu
source activate base
conda activate wgpu
# Clone only if necessary
if [ ! -d "emsdk" ]; then
    git clone https://github.com/emscripten-core/emsdk.git
else
    (cd emsdk && git pull)

fi
cd emsdk
./emsdk install $EMSCRIPTEN_VERSION
./emsdk activate $EMSCRIPTEN_VERSION
CONDA_PREFIX=$(conda info --base)/envs/wgpu
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo "#!/bin/sh" > $CONDA_PREFIX/etc/conda/activate.d/emscripten.sh
echo "source $PWD/emsdk_env.sh" >> $CONDA_PREFIX/etc/conda/activate.d/emscripten.sh
