# r-knative
Example of building R APIs for Knative

Using something like R-Plumber it is very easy to create APIs for R-scripts and run statistical computing and graphics on a Kubernetes cluster using Knative. 

Looking at `api.R` you can see examples of how you can define endpoints for your applications and still leverage all the power and ecosystem or the R Language inside containers with minimal effort. As an example: 

```
#* Plot a histogram
#* @png
#* @get /plot
plot <- function(){
  rand <- rnorm(100)
  hist(rand)
}
```

Now you can build a container and deploy this endpoint that will auto-scale and receive events (run serverless) with 3 basic steps: 

1. `docker build . t <your/containername>`   # build your local script into the container
1. `docker push <your/containername>`   # push your container image to a registry
1. `kn service create my-r-api --image=<your/containername> --limits-cpu=0.5 --limits-memory=100M`   # create a Knative Service

This will give you an API endpoint where you can access the `plot` function to access your API. 

The R-Plumber website has more details about more complex applications that can be built using the framework.


# References 
https://www.rplumber.io/docs/
https://www.r-project.org/
