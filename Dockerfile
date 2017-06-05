FROM nvidia/cuda:8.0-devel-ubuntu16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/cuda/samples/0_Simple/vectorAdd
RUN make
RUN apt-get install wget
RUN mkdir lab ;  cd /lab; wget http://us.download.nvidia.com/XFree86/Linux-x86_64/375.39/NVIDIA-Linux-x86_64-375.39.run ; chmod 777 * ; ./NVIDIA-Linux-x86_64-375.39.run -s

CMD ./vectorAdd
