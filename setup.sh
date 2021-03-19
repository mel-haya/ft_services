minikube delete
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)


docker build srcs/phpmyadmin -t phpmyadmin 
docker build srcs/nginx -t nginx 
docker build srcs/Wordpress -t wordpress
docker build srcs/mysql -t mysql
docker build srcs/ftps -t ftps

minikube addons enable metallb

kubectl apply -f srcs/yamlfiles 


sleep 3
minikube dashboard &
kubectl get pods
