<h1>K8s cluster provisioning using <b> Terraform</b> and <b>Ansible</b></h1>
<p>Kubernetes Cluster Setup with Terraform and Ansible on DigitalOcean</p>
<h3>
  Overview
</h3>
<p>
This project automates the provisioning of a Kubernetes cluster on DigitalOcean using Terraform for infrastructure setup and Ansible for configuring Kubernetes nodes.
</p>
<h3>
  Prerequisites
</h3>
<p>
Before you begin, ensure you have the following prerequisites installed:
</p>
<ul>
  <li>
    Terraform
  </li>
  <li>
    Ansible
  </li>
  <li>
DigitalOcean account and API token
  </li>
</ul>

<h3>
  Getting Started
</h3>

<p>
  Terraform Setup
</p>
<p><i>Before going forward, give value to all required variables</i></p>
<ul>
  <li>
  <h5>Starting with the<br><br> <i> $ terraform init </i></h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/d1af8acc-f6d0-4942-aea3-1f403dc88d1e">
    </li>
  <li>
    <h5>use this command with your variable<br><br> <i> $ terraform plan -var "do_token=${ YOUR_DIGITAL_OCEAN_ACCESS_TOKEN }" </i></h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/d681fe79-b055-448d-ab36-8734ee9e4a95">
  </li>
    <li>
<h5>Use the apply command to apply all the changes for the creation of the resources.<br><br> $ terraform apply -var "do_token=${ YOUR_DIGITAL_OCEAN_ACCESS_TOKEN }" </i></h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/73a04658-9a33-4334-b54b-ea9e97cd8da3">
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/deaae9f5-ce58-45ad-b438-7d641ef03f8e">
  </li>
  
</ul>

<h2>
Now it has our compute resources on Digital Ocean. We can start configuring them according to our needs to create a K8s. cluster.
</h2>
<h3>Ansible setup</h3><br>
<ul>
  <li>
    <h5>
We store the IP address of the droplets on the file name hosts to create an ansible inventory.
    </h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/868f1e3b-8d90-45bd-9280-1e33b585b7c7">
  </li>
   <li>
    <h5>
We use the very first command, which will install Kubeadm, Kublet, and Kubectl on all droplets.
    </h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/b1b00d92-1a6d-41c7-ac5c-2934589f1200">
     <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/e03410c0-5fe1-4486-8d8d-b7a1dccbcdc0">
  </li>
  <li>
    <h5>
      Now we run the playbook that contains the container runtime environment and setup the master node of our K8s cluster
    </h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/c62de092-d2be-465f-b1a8-294a4fa4df6d">
  </li>
   <li>
    <h5>
      Now we run the playbook that contains the container runtime environment and setup the worker nodes of our K8 cluster
    </h5>
    <img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/d8ba5fa6-e16b-4877-9a5c-9aa491c0fd7b">
  </li>
</ul>

<h3>
  Now our K8s cluster with 1 master and 2 worker nodes is established and we also confirmed it using ssh
</h3>
<img src="https://github.com/JATINKUMAR1008/K8s-cluster-setup-Ansible/assets/97216852/8552a71f-4d49-4105-84cb-35adb730e916">

