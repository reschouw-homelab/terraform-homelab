resource "helm_release" "calico" {
    name = "calico"
    repository = "https://docs.tigera.io/calico/charts"
    chart = "tigera-operator"
    namespace = "tigera-operator"
    version = "v3.30.3"
    create_namespace = true
}