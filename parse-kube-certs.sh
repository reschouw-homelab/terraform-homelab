#!/bin/bash

# parse-kube-certs.sh
# This script extracts Kubernetes certificates and keys from a kubeconfig file
# and saves them as separate files in the ~/.kube directory.
# This is useful for setting up the terraform kubernetes provider.

set -e

KUBECONFIG_PATH="$HOME/.kube/config"
OUTPUT_DIR="$HOME/.kube"

# Check if kubeconfig file exists
if [ ! -f "$KUBECONFIG_PATH" ]; then
    echo "Error: kubeconfig file not found at $KUBECONFIG_PATH"
    exit 1
fi

# Check if yq is installed
if ! command -v yq &> /dev/null; then
    echo "Error: yq is required but not installed. Please install yq first."
    echo "You can install it with: brew install yq"
    exit 1
fi

echo "Parsing certificates from $KUBECONFIG_PATH..."

# Extract client certificate
echo "Extracting client certificate..."
CLIENT_CERT_DATA=$(yq eval '.users[0].user.client-certificate-data' "$KUBECONFIG_PATH")
if [ "$CLIENT_CERT_DATA" != "null" ] && [ -n "$CLIENT_CERT_DATA" ]; then
    echo "$CLIENT_CERT_DATA" | base64 -d > "$OUTPUT_DIR/client_certificate"
    echo "✓ Client certificate saved to $OUTPUT_DIR/client_certificate"
else
    echo "Warning: client-certificate-data not found or empty"
fi

# Extract client key
echo "Extracting client key..."
CLIENT_KEY_DATA=$(yq eval '.users[0].user.client-key-data' "$KUBECONFIG_PATH")
if [ "$CLIENT_KEY_DATA" != "null" ] && [ -n "$CLIENT_KEY_DATA" ]; then
    echo "$CLIENT_KEY_DATA" | base64 -d > "$OUTPUT_DIR/client_key"
    echo "✓ Client key saved to $OUTPUT_DIR/client_key"
else
    echo "Warning: client-key-data not found or empty"
fi

# Extract cluster CA certificate
echo "Extracting cluster CA certificate..."
CA_CERT_DATA=$(yq eval '.clusters[0].cluster.certificate-authority-data' "$KUBECONFIG_PATH")
if [ "$CA_CERT_DATA" != "null" ] && [ -n "$CA_CERT_DATA" ]; then
    echo "$CA_CERT_DATA" | base64 -d > "$OUTPUT_DIR/cluster_ca_certificate"
    echo "✓ Cluster CA certificate saved to $OUTPUT_DIR/cluster_ca_certificate"
else
    echo "Warning: certificate-authority-data not found or empty"
fi

# Extract cluster server URL
echo "Extracting cluster server URL..."
SERVER_URL=$(yq eval '.clusters[0].cluster.server' "$KUBECONFIG_PATH")
if [ "$SERVER_URL" != "null" ] && [ -n "$SERVER_URL" ]; then
    # Remove trailing newline
    CLEAN_HOST=$(echo "$SERVER_URL" | tr -d '\n')
    echo -n "$CLEAN_HOST" > "$OUTPUT_DIR/host"
    echo "✓ Cluster server URL saved to $OUTPUT_DIR/host (cleaned: $CLEAN_HOST)"
else
    echo "Warning: server URL not found or empty"
fi

echo "Certificate extraction completed!"
echo "Files created in $OUTPUT_DIR:"
echo "  - client_certificate"
echo "  - client_key"
echo "  - cluster_ca_certificate"
echo "  - host"

