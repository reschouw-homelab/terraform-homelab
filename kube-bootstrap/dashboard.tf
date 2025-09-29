resource "helm_release" "kubernetes_dashboard" {
    name = "kubernetes-dashboard"
    repository = "https://kubernetes.github.io/dashboard/"
    chart = "kubernetes-dashboard"
    namespace = "kubernetes-dashboard"
    version = "7.13.0"
    create_namespace = true
}

# resource "kubernetes_manifest" "dashboard_ingress" {
#     manifest = manifest_decode(file("dashboard/ingress.yaml"))
# }

resource "kubernetes_manifest" "dashboard_user" {
    manifest = provider::kubernetes::manifest_decode(file("dashboard/user.yml"))
}

resource "kubernetes_manifest" "dashboard_role" {
    manifest = provider::kubernetes::manifest_decode(file("dashboard/role.yml"))
}

resource "kubernetes_manifest" "dashboard_service" {
    manifest = provider::kubernetes::manifest_decode(file("dashboard/service.yml"))
}