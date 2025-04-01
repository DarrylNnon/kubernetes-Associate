# create and apply the yaml files
pod, deployment, service

# Apply them

```sh
kubectl apply -f pod.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml
```

# check the resources

```sh
kubectl apply -f pod.yml
```

![alt text](image.png)

```sh
kubectl apply get deployments
```

![alt text](image-1.png)

```sh
kubectl get services
```

![alt text](image-2.png)