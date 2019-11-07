# Terraform Resource
This resource is to automated provisioning AWS EKS cluster for my final exam

## How to use

```
$ terraform init 

```

This command above is to download some plugin to connect from your terraform to AWS cloud

```
$ terraform plan
```

This command above is to plan what resource will be create 

``` 
$ terraform apply 
```

This command above is to apply what resource you want to plan before


### Post Section

after the last command , you will need to configure your kubectl command to connect with your AWS EKS

```
$ mkdir ~/.kube/ 

```

After that you create directory now you can configure it 

```
$ terraform output kubeconfig>~/.kube/config
```

By Default the worker node cannot join automatically, so you must run the command below

```
$ terraform output config_map_aws_auth > configmap.yml
$ kubectl apply -f configmap.yml

