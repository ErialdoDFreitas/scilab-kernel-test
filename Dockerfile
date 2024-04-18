# Use uma imagem base do Jupyter Notebook que tenha o Python 3.8
FROM jupyter/base-notebook:python-3.8.8

# Instale o pip, o gerenciador de pacotes do Python
#RUN apt-get install -y python3-pip

# Instale o scilab-kernel usando o pip
RUN conda install scilab-kernel

# Configure o scilab-kernel
RUN echo "c = get_config()\n\
c.ScilabKernel.plot_settings = {\n\
    'backend': 'inline',\n\
    'format': 'svg',\n\
    'width': 6,\n\
    'height': 4,\n\
    'bbox_inches': 'tight'\n\
}" > ~/.jupyter/scilab_kernel_config.py

# Verifique a instalação do scilab-kernel
RUN python -m scilab_kernel.check
