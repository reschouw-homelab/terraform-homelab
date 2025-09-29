resource "helm_release" "kubernetes_dashboard" {
    name = "kubernetes-dashboard"
    repository = "https://kubernetes.github.io/dashboard/"
    chart = "kubernetes-dashboard"
    namespace = "kubernetes-dashboard"
    version = "7.13.0"
    create_namespace = true
}

resource "kubernetes_manifest" "dashboard_ingress" {
    manifest = manifest_decode(file("kubernetes-dashboard-ingress.yaml"))
}