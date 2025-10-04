resource "helm_release" "argocd" {
    name = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    namespace = "argocd"
    version = "8.5.8"
    create_namespace = true
}

resource "kubernetes_manifest" "argocd_ingress" {
    manifest = provider::kubernetes::manifest_decode(file("argocd/nodePort.yml"))
    depends_on = [ helm_release.argocd ]
}