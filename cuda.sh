# Update the system and install necessary packages
echo "Updating system packages..."
apt update && apt upgrade -y

# Install CUDA toolkit
wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8

# Install PyTorch with specific index URL
echo "Installing PyTorch..."
pip3 install torch==2.4.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Install other Python dependencies
echo "Installing Python dependencies..."
pip3 install kaleido transformers tqdm pandas numpy accelerate jupyter z pandas-profiling plotly matplotlib scikit-learn

# set cuda environment variables
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64

# install flash-attn
pip3 install flash-attn --no-build-isolation

# install plotly matplotlib
echo "All dependencies installed successfully!"