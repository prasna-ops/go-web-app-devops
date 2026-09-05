sudo apt-get update && sudo apt-get install -y unzip curl

# x86_64
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# for ARM/Graviton use this URL instead:
# curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

unzip -q awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/