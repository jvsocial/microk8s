sudo snap install microk8s --classic --channel=1.31
sudo usermod -a -G microk8s ubuntu
mkdir -p ~/.kube
chmod 0700 ~/.kube
chown -R ubuntu ~/.kube
