# kubernetes-Associate
Hands-on implementation of kubernetes with andrew brown

# Review of light weight containers

step 1: Building an using docker
 go to aws and tape cloud9 -> environment-> create environment

 # install ruby latest version

 `rvm install 3.1.0`

 `cd / app -> bundle install -> bundle exec ruby server.rb -> docker build . -t sinatra-sample -> docker image`

 `[https://www.codewithjason.com/dockerize-sinatra-application/](https://www.codewithjason.com/dockerize-sinatra-application/)`

```
 => ERROR [4/4] RUN bundle install                                                                                          1.7s
------
 > [4/4] RUN bundle install:
0.408 Warning: the running version of Bundler (2.1.4) is older than the version that created the lockfile (2.5.11). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.5.11`.
0.951 Fetching gem metadata from https://rubygems.org/....
1.528 rack-protection-4.1.1 requires ruby version >= 2.7.8, which is incompatible with
1.528 the current version, ruby 2.7.4p191
------
dockerfile:7
--------------------
   5 |     WORKDIR /code
   6 |     COPY . /code
   7 | >>> RUN bundle install
   8 |     
   9 |     EXPOSE 4567
--------------------
ERROR: failed to solve: process "/bin/sh -c bundle install" did not complete successfully: exit code: 5
@DarrylNnon ➜ /workspaces/kubernetes-Associate/app (3-day-02-k8s) $ gem install bundler:2.5.11
Fetching bundler-2.5.11.gem
Successfully installed bundler-2.5.11
Parsing documentation for bundler-2.5.11
Installing ri documentation for bundler-2.5.11
Done installing documentation for bundler after 0 seconds
1 gem installed

A new release of RubyGems is available: 3.5.11 → 3.6.5!
Run `gem update --system 3.6.5` to update your installation.
```
## update the gem file using the latest version
`gem update --system 3.6.5`

## create a public repository to store our app on aws ECR

```
Push commands for sinatra-sample


macOS / Linux

Windows
Make sure that you have the latest version of the AWS CLI and Docker installed. For more information, see Getting Started with Amazon ECR .
Use the following steps to authenticate and push an image to your repository. For additional registry authentication methods, including the Amazon ECR credential helper, see Registry Authentication .
Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI:
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/y1k2j8d7
Note: If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.

Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:
docker build -t sinatra-sample .

After the build completes, tag your image so you can push the image to this repository:
docker tag sinatra-sample:latest public.ecr.aws/y1k2j8d7/sinatra-sample:latest

Run the following command to push this image to your newly created AWS repository:
docker push public.ecr.aws/y1k2j8d7/sinatra-sample:latest
```

## Minikube follow along
- [minikube.install](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)

```
- curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
- sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
- minikube start

```

Minikube is use for the testing envionment

to use minikube in gitpod we do:
we install minikube
we install kubectl
we chmod kubectl `chmod u+x kubectl`
we move into the bin file `sudo mv kubectl /usr/local/bin`

# create k8s folder where we create ad eployment.yaml file and paste the deplyoment from this resource:
- [rails-app-deployment-kubernetes](https://www.honeybadger.io/blog/rails-on-kubernetes/)

# to deploy the app in kubernetes we do 
`kubectl apply -f k8s/deployment.yml`
 next to verify the deployment we do: `kubectl get deployments`

 when we run port in kubernetes their are available by default and in order to reach them we have to use aa service wich is going to assign an ip addre on the deployment or ussing a port forwarding
 `kubectl port-forward deployment/sinatra 8080:4567 --address 0.0.0.0 ` after we do a `curl localhost:8080`

 ## kubernetes dashboard
 `step to use it on cloud9 -> stop the cluster (minikube stop)-> minikube start --listen-address='0.0.0.0' we notice that we loose our app wich is find now we are going to do -> kubectl proxy --address='0.0.0.0' --disable-filter=true -> add inbound on secruity group and allow port 8081 for dasboard and copy the ip and add the link provided by the terminal to your browser.`