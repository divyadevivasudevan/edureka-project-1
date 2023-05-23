cat <<EOF > /etc/yum.repos.d/Kubernetes.repo
[Kubernetes]
name=Kubernetes
baseurl= https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables=1
net.bridge.bridge-nf-call-iptables=1
EOF

sysctl --system

yum install -y kubeadm-1.21.3 kubelet-1.21.3 kubectl-1.21.3 --disableexcludes=kubernetes
yum install -y kubeadm-1.25 kubelet-1.25 kubectl-1.25 --disableexcludes=kubernetes

systemctl enable kubelet
systemctl start kubelet

sudo kubeadm init --apiserver-advertise-address=172.31.46.59  --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU --ignore-preflight-errors=Mem

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/



mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 172.31.46.59:6443 --token t8g1bs.dsulnfuym0vlog7u \
        --discovery-token-ca-cert-hash sha256:87eac0aa1b18eb3d38069cdf46a36159290ad1a18661e1c1192913c281acdcfb

#install a flannel network plugin to enable pod communication

sudo kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yml

kubectl apply -f https://docs.projectcalico.org/v3.3