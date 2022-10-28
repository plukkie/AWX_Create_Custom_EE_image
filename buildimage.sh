#DEFINE VARS
image=<your repo name. i.e yourrepo/awx-ee:latest>

ansible-builder build --tag $image --context ./context --container-runtime docker

# login to docker and push to docker hub
docker login
#docker push $image

echo "Done"
echo "Please Upload your image to docker hub: 'docker push $image'"
echo && echo

