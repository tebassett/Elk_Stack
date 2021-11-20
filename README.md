# Elk_Stack
Elk Stack for cloud monitoring

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/tebassett/Elk_Stack/blob/main/Diagrams/ELK%20Project.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

[Elk Stack Files](https://github.com/tebassett/Elk_Stack/tree/main/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


## **Description of the Topology**

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network, and off-loading attack traffic from the vulnerable servers.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the OS and system files. 

The configuration details of each machine may be found below.

| Name      | Function | IP Address | Operating System     |
|-----------|----------|------------|----------------------|
| Jump Box  | Gateway  | 10.0.0.4   | Linux Ubuntu 18.04.1 |
| Web-1     | Server   | 10.0.0.5   | Linux Ubuntu 18.04.1 |
| Web-2     | Server   | 10.0.0.6   | Linux Ubuntu 18.04.1 |
| Elk Stack | Monitor  | 10.1.0.4   | Linux Ubuntu 18.04.1 |

## Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 77.179.27.132

Machines within the network can only be accessed via SSH through the ansible container on the Jumpbox.

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses |
|-----------|---------------------|----------------------|
| Jump Box  | SSH Only            | 77.179.27.132        |
| Web-1     | No                  | 10.0.0.4             |
| Web-2     | No                  | 10.0.0.4             |
| Elk Stack | Port 5601 Only      | 77.179.27.132        |

## **Elk Configuration**

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automated configuration efficaciously reduces the potential for human error during configuration. It also ensures uniform configuration across a shared resource group. 

The playbook implements the following tasks:
- Installs Docker.io
- Installs Python3-pip
- Installs Docker's Python Module
- Increases virtual memory
- Downloads Elk container image and configures to start on bood
- Enables Docker to start on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/tebassett/Elk_Stack/blob/main/Images/docker_ps_output.PNG)

## **Target Machines & Beats**
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6

We have installed the following Beats on these machines:
> Filebeat
> Metricbeat

These Beats allow us to collect the following information from each machine:
> `Filebeat` forwards and centralizes log data. Specifically, it monitors the server's log files and/or locations specified by the user, collects the log events, and then forwards them to Elasticsearch for indexing.

> `Metricbeat` periodically collects metrics from the OS and running server services. These collected data sets are then fowarded to Elasticsearch for output.

## **Using the Playbook**
In order to use the `Filebeat` playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- 1. Copy the configuration file `filebeat-config.yml` to `/etc/ansible/files`.
- 2. Copy the playbook file `filebeat-playbook.yml` to `/etc/ansible/roles`. 
- 3. Update the `filebeat-config.yml` file to include `output.elasticsearch` as hosts `["YOUR_ELK_HIDDEN_IP:9200"]`. Leave `username:  "elastic"` and `password: "changme"` as they are.  Also update `setup.kibana` as `host:  "YOUR_ELK_HIDDEN_IP:9200"`.
- 4. Run the playbook, and navigate to `YOUR_ELK_PUBLIC_IP:5601/app/kibana` to check that the installation worked as expected. Under `Logs`, click `Add log data`. Then click `System logs`. Under `Getting Started` select `DEB`. Scroll to the bottom to `Module status` and click `Check data`. If the connection was successful, you will see `Data successfully received from this module`. 

- Now repeat steps 1-3 for `Metricbeat`. For step 4, after you run the plabook navigate to `YOUR_ELK_PUBLIC_IP:5601/app/kibana`, under `Metrics`, click `Add metric data`. Then click `Docker metrics`. Under `Getting Started` select `DEB`. Scroll to the bottom to `Module status` and click `Check data`. If the connection was successful, you will see `Data successfully received from this module`. 

### **Helping Hand**
Useful commands for playbook and config file: 

- `sudo nano SPECIFIC_BEAT-config.yml` to edit the config file
- `sudo nano SPECIFIC_BEAT-playbook.yml` to edit the playbook file
- `ansible-playbook SPECIFIC_BEAT-playbook.yml` to run the playbook
