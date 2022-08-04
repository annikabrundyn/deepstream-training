ARG ML_IMAGE=nvcr.io/nvidia/deepstream:6.1-samples
FROM ${ML_IMAGE}

# install jupyter
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev
RUN pip install jupyterlab

RUN apt-get install -y python3-gi python3-dev python3-gst-1.0 python-gi-dev git python-dev \
    python3 python3-pip python3.8-dev cmake g++ build-essential libglib2.0-dev \
    libglib2.0-dev-bin libgstreamer1.0-dev libtool m4 autoconf automake libgirepository1.0-dev libcairo2-dev

# install deepstream python bindings
RUN apt-get install -y wget
RUN wget https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/releases/download/v1.1.3/pyds-1.1.3-py3-none-linux_x86_64.whl
RUN pip install pyds-1.1.3-py3-none-linux_x86_64.whl

WORKDIR /opt/nvidia/deepstream/deepstream-6.1/sources/
RUN git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps

WORKDIR /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps/
RUN git submodule update --init

RUN apt-get install -y apt-transport-https ca-certificates -y
RUN update-ca-certificates

WORKDIR /opt/nvidia/deepstream/deepstream-6.1/sources/deepstream_python_apps/3rdparty/gst-python/
RUN ./autogen.sh
RUN make
RUN make install
 
WORKDIR /opt/nvidia

