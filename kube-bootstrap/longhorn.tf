resource "helm_release" "longhorn" {
    name = "longhorn"
    repository = "https://charts.longhorn.io"
    chart = "longhorn"
    namespace = "longhorn-system"
    version = "1.10.0"
    create_namespace = true
}

resource "kubernetes_manifest" "longhorn_service" {
    manifest = provider::kubernetes::manifest_decode(file("longhorn-storage/service.yml"))
    depends_on = [ helm_release.longhorn ]
}

resource "kubernetes_manifest" "longhorn_storage_class" {
    manifest = provider::kubernetes::manifest_decode(file("longhorn-storage/storage-class.yml"))
    depends_on = [ helm_release.longhorn ]
}