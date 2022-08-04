# DeepStream Training

This training was tested on an AWS EC2 **g4dn.4xlarge** instance (T4 GPU).

## Setup

When creating the instance, use the Deep Learning AMI (Ubuntu 20.04) and make sure to allow ports 22 and 8888.

SSH into your EC2 instance using your key-pair. Create a key-pair if you don't have one.
```bash
ssh -i <your pem key> ubuntu@<Your DNS name>
```


## Running the notebooks

Once in the AMI, run the following steps:

```bash
# Clone repo
git clone https://github.com/annikabrundyn/deepstream-training.git
cd deepstream-training

# Build the docker image
bash scripts/docker_build.sh

# Run the container
bash scripts/docker_launch.sh

# Start JupyterLab
jupyter-lab --allow-root --ip 0.0.0.0 --NotebookApp.token=""
```
