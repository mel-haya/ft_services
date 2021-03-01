minikube delete
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)


docker build srcs/phpmyadmin -t phpmyadmin 
docker build srcs/nginx -t nginx 
docker build srcs/Wordpress -t wordpress
docker build srcs/mysql -t mysql

# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

minikube addons enable metallb

kubectl apply -f srcs/yamlfiles 


sleep 3
minikube dashboard &
kubectl get pods
