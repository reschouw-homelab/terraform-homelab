# resource "helm_release" "ingress_nginx" {
#     name = "ingress-nginx"
#     repository = "https://kubernetes.github.io/ingress-nginx"
#     chart = "ingress-nginx"
#     namespace = "ingress-nginx"
#     version = "4.13.2"
#     create_namespace = true
#     # I think the terraform provider is expecting something more than the 
#     # controller to exist, and this helm chart doesn't do that? 
#     wait = false
#     values = [
#         file("ingress-nginx/values.yaml")
#     ]
# }