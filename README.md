# AWX_Create_Custom_EE_image
Create your custom AWX Ansible execution environment to be used on Ansible Tower AWX.
Within AWX you can use your personal execution environment image.
This is usefull if the native available awx-ee image does not provide the desired ansible collections or pip libraries.
You create your Custom EE (CEE) image once and push it to a container hub registry.
In my case I use the docker hub, but it can be any reachable hub.

## Tested on
- Ubuntu 20.04.5 LTS
- python3.8
- AWX 21.5.0
- docker 20.10.12, build 20.10.12-0ubuntu2~20.04.1

## Ensure these Dependencies requirements are met
- python3.8
- docker
- a registry to push your custom ee image (like aws, docker, quay.io
- Running AWX Tower with AWX Operator

## Quick steps
- login to your AWX host/VM as regular user (no need to be root) and go to location of choice
- git clone https://github.com/plukkie/AWX_Create_Custom_EE_image.git
- cd AWX_Create_Custom_EE_image
- python3 -m venv venv
- source venv/bin/activate
- pip3 install ansible
- pip3 install ansible-builder==1.0.0.0a1
- edit the requirement files have specific packages installed;
  - bindep.txt for system packages needed
  - requirements.txt for python/pip packages needed  <== Lookout on this one for desired ansible-core version
  - requirements.yml for ansible collections  <== Lookout for this one for desired collections (i.e. vendor collections)
  - You can leave the defaults, it installs collections for Dellemc OS10 and SONiC network collections
- Configure your personal repo image name:tag in the buildimage.sh (i.e awxee-repo/custom-awx-ee:latest)
- Run ./buildimage.sh

## Add your Custom EE to AWX
- login to AWX dashboard
- Go to 'Administration' , 'Execution Environments'
- Click add;
  - Give it a name of choice
  - For image select your full repo name
  - Pull dropdown you can select 'only pull the image if not present', then it will pull only once

Enjoy!
Peter alias plukkie
