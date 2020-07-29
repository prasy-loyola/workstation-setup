$cpus = 4
$memory = 6196

minikube config set cpus $cpus
minikube config set memory $memory
minikube start  --mount-string="${HOME}:/host" --mount
minikube addons enable ingress
